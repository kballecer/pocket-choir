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
    var input_gain: Double!
    var output_mix: AKMixer!
    
    //var harmonizer: Harmonizer
    
    init() {
        
        input_signal = AKMicrophone()
        input_booster = AKBooster(input_signal)
        input_booster.gain = 1.0
        output_mix = AKMixer(input_booster)
        output_mix.volume = 1.0
        input_gain = 0.0
        
        //harmonizer = Harmonizer(input: input_booster)
        
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
        
        AudioKit.output = input_booster
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        //harmonizer.update()
        print("hello")
    }
    
    
}
