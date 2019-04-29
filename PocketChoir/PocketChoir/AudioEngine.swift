//
//  AudioEngine.swift
//  PocketChoir
//
//  Created by David on 3/25/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import Foundation
import AudioKit

class AudioEngine {
    
    var input_signal: AKMicrophone!
    var input_booster: AKBooster!
    var harmonizer: Harmonizer!
    var wet_booster: AKBooster!
    var dry_booster: AKBooster!
    var wet_dry_mix: AKMixer!
    var output_mix: AKMixer!
    
    //Reverb Node
    var reverb: AKCostelloReverb!
    var reverbOn = false
    
    //Delay Node
    var delay: AKDelay!
    var delayOn = false
    
    
    init() {
        
        //AKSettings initializers
        AKSettings.bufferLength = .medium
        
        do {
            try AKSettings.setSession(category: .playAndRecord, with: .allowBluetoothA2DP)
        } catch {
            AKLog("could not set session category")
        }
        
        AKSettings.defaultToSpeaker = true
        AKSettings.audioInputEnabled = true
        AKSettings.useBluetooth = true

        //Signal Chain
        input_signal = AKMicrophone()
        input_booster = AKBooster(input_signal)
        
        harmonizer = Harmonizer(input_booster)
        wet_booster = AKBooster(harmonizer)
        dry_booster = AKBooster(input_booster)
        wet_dry_mix = AKMixer(wet_booster, dry_booster)

        delay = AKDelay(wet_dry_mix)
        delay.time = 0
        delay.feedback = 0
        delay.dryWetMix = 0
        delay.stop()
        reverb = AKCostelloReverb(delay)
        reverb.feedback = 0
        reverb.cutoffFrequency = 9_900
        reverb.stop()
        
        output_mix = AKMixer(reverb)
        AudioKit.output = output_mix
        
        input_booster.gain = 0.0
        wet_booster.gain = 0.0
        dry_booster.gain = 0.0
        wet_dry_mix.volume = 1.0
        output_mix.volume = 0.0
        
        //Starting AudioKit
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        //Update timer
        Timer.scheduledTimer(timeInterval: 0.0000001, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        harmonizer.update()
        
        (reverbOn) ? reverb.start() : reverb.stop()
        (delayOn) ? delay.start() : delay.stop()
    }
    
    func ftom(_ frequency: Double) -> Double {
        let midiNote = 69 + 12 * log2(frequency/440)
        return midiNote
    }
    
    func mtof(_ midiNote: Double) -> Double {
        let frequency: Double = 440 * pow(2, (midiNote - 69)/12)
        return frequency
    }
    
    func reverb_fbUpdate(_ feedback: Double) {
        reverb.feedback = feedback / 100
    }
    
    func delay_timeUpdate(_ time: Double) {
        delay.time = time / 100
    }
    
    func delay_fbUpdate(_ feedback: Double) {
        delay.feedback = feedback / 100
    }
    
    func delay_dwMixUpdate(_ dw: Double) {
        delay.dryWetMix = dw / 100
    }
}
