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
    var harmonizer_booster: AKBooster!
    var sampler: Sampler!
    var sample_booster: AKBooster!
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
        input_booster.gain = 1.0
        harmonizer = Harmonizer(input_booster)
        harmonizer_booster = AKBooster(harmonizer)
        sampler = Sampler(input_booster)
        sample_booster = AKBooster(sampler)

        reverb = AKCostelloReverb(harmonizer)
        reverb.feedback = 0
        reverb.cutoffFrequency = 9_900
        reverb.stop()
        delay = AKDelay(reverb)
        delay.time = 0
        delay.feedback = 0
        delay.dryWetMix = 0
        delay.stop()
        output_mix = AKMixer(harmonizer, sampler)
        output_mix.volume = 1.0
        AudioKit.output = output_mix
        
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
