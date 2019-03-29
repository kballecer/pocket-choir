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
    var input_gain: Double = 1
    var harmonizer_gain: Double = 1
    var output_gain: Double = 1
    
    var input_signal: AKMicrophone!
    var input_booster: AKBooster!
    var harmonizer: Harmonizer!
    //var drywet_mix: AKDryWetMixer!
    var output_mix: AKMixer!
    
    
    
    //Harmonizer Nodes
    var freq_tracker: AKFrequencyTracker!
    var shifter1: AKPitchShifter!
    var shifter2: AKPitchShifter!
    var shifter3: AKPitchShifter!
    var shifter4: AKPitchShifter!
    var shifters: [AKPitchShifter]!
    var lead_shifter: AKPitchShifter!
    var harmonizer_mix: AKMixer!
    
    var tonic: Double = 48
    var current_pitch: Double = 0
    var target_pitch: Double = 0
    
    var shift1: Double = 0
    var shift2: Double = 0
    var shift3: Double = 0
    var shift4: Double = 0
//    var shifts: [Double]
    var lead_shift: Double = 0
    
    var target_chord: [Double]
    let one_chord: [Double] = [-12, 0, 4, 7]
    let two_chord: [Double] = [-10, 2, 5, 9]
    let three_chord: [Double] = [-8, 4, 7, 11]
    let four_chord: [Double] = [-7, 5, 9, 12]
    let five_chord: [Double] = [-5, 7, 11, 14]
    let six_chord: [Double] = [-3, 9, 12, 16]
    let seven_chord: [Double] = [-5, 11, 14, 17]
    let eight_chord: [Double] = [0, 12, 16, 19]
    
    
    
    
    
    
    
    init() {
        
        input_signal = AKMicrophone()
        freq_tracker = AKFrequencyTracker(input_signal)
        input_booster = AKBooster(freq_tracker)
        input_booster.gain = input_gain
//        harmonizer = Harmonizer(input_booster)
        
        
        shifter1 = AKPitchShifter(input_booster)
        shifter2 = AKPitchShifter(input_booster)
        shifter3 = AKPitchShifter(input_booster)
        shifter4 = AKPitchShifter(input_booster)
        shifters = [shifter1, shifter2, shifter3, shifter4]
        lead_shifter = AKPitchShifter(input_booster)
        
        for shifter in shifters {
            shifter.windowSize = 2048
            shifter.crossfade = 1024
            shifter.rampDuration = 0.001
        }
        
        harmonizer_mix = AKMixer(shifter1, shifter2, shifter3, shifter4)
        harmonizer_mix.volume = harmonizer_gain
        //output_mix = AKMixer(input_booster, shifter1, shifter2, shifter3, shifter4)
        output_mix = AKMixer(input_booster, harmonizer_mix)
        output_mix.volume = output_gain
        AudioKit.output = output_mix
        
        target_chord = one_chord

        
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

        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        Timer.scheduledTimer(timeInterval: 0.0000001, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    func chord_update(_ chord_pressed: Double) {
        switch chord_pressed {
        case 1:
            target_chord = one_chord
            break
        case 2:
            target_chord = two_chord
            break
        case 3:
            target_chord = three_chord
            break
        case 4:
            target_chord = four_chord
            break
        case 5:
            target_chord = five_chord
            break
        case 6:
            target_chord = six_chord
            break
        case 7:
            target_chord = seven_chord
            break
        case 8:
            target_chord = eight_chord
            break
        default:
            print("problem in chord switch")
            break
        }
        
        
    }
    
    func lead_update(_ key_pressed: Double) {
        target_pitch = key_pressed
    }
    
    @objc func update() {
//        lead_shift = (tonic + target_pitch) - current_pitch
//        lead_shifter.shift = lead_shift
        current_pitch = ftom(freq_tracker.frequency)
        for i in 0..<shifters.count {
            shifters[i].shift = (tonic + target_chord[i]) - current_pitch
        }
    }
    
    func ftom(_ frequency: Double) -> Double {
        let midiNote = 69 + 12 * log2(frequency/440)
        return midiNote
    }
    
    func mtof(_ midiNote: Double) -> Double {
        let frequency: Double = 440 * pow(2, (midiNote - 69)/12)
        return frequency
    }
    
}
