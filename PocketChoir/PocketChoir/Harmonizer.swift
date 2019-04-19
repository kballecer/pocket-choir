//
//  Harmonizer.swift
//  PocketChoir
//
//  Created by David on 3/26/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import Foundation
import AudioKit

class Harmonizer: AKNode, AKInput {
    
    var freq_tracker: AKFrequencyTracker = AKFrequencyTracker()
    var shifter1: AKPitchShifter!
    var shifter2: AKPitchShifter!
    var shifter3: AKPitchShifter!
    var shifter4: AKPitchShifter!
    var shifters: [AKPitchShifter]!
    var lead_shifter: AKPitchShifter!
    var output_mix: AKMixer!
    
    var shift1: Double = 0
    var shift2: Double = 0
    var shift3: Double = 0
    var shift4: Double = 0
    var lead_shift: Double = 0
    
    var current_pitch: Double = 60
    var target_pitch: Double = 60
    var lead_note: Double = 60
    var tonic: Double = 60

    var target_chord: [Double]
    let one_chord: [Double] = [-12, 0, 4, 7]
    let two_chord: [Double] = [-10, 2, 5, 9]
    let three_chord: [Double] = [-8, 4, 7, 11]
    let four_chord: [Double] = [-7, 5, 9, 12]
    let five_chord: [Double] = [-5, 7, 11, 14]
    let six_chord: [Double] = [-3, 9, 12, 16]
    let seven_chord: [Double] = [-1, 11, 14, 16]
    let eight_chord: [Double] = [0, 12, 16, 19]
    
    
    var inputNode: AVAudioNode {
        return freq_tracker.avAudioNode
    }
    
    init(_ input: AKNode) {
        
        input.connect(to: freq_tracker)
        
        target_chord = one_chord
        shifter1 = AKPitchShifter(freq_tracker)
        shifter2 = AKPitchShifter(freq_tracker)
        shifter3 = AKPitchShifter(freq_tracker)
        shifter4 = AKPitchShifter(freq_tracker)
        shifters = [shifter1, shifter2, shifter3, shifter4]
        lead_shifter = AKPitchShifter(freq_tracker)
        
        for shifter in shifters {
            shifter.windowSize = 2048
            shifter.crossfade = 1024
            shifter.rampDuration = 0.001
        }
        lead_shifter.windowSize = 2048
        lead_shifter.crossfade = 1024
        lead_shifter.rampDuration = 0.001
        
        output_mix = AKMixer(shifter1, shifter2, shifter3, shifter4, lead_shifter)
        output_mix.volume = 1.0
        
        super.init()
        self.avAudioNode = output_mix.avAudioNode
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
    
    func update() {
        current_pitch = ftom(freq_tracker.frequency)
        for i in 0..<shifters.count {
            shifters[i].shift = (tonic + target_chord[i]) - current_pitch
        }
        lead_shifter.shift = (tonic + target_pitch + 12) - current_pitch
    }

    func ftom(_ frequency: Double) -> Double {
        let midiNote = 69 + 12*log2(frequency/440)
        return midiNote
    }
    
    func mtof(_ midiNote: Double) -> Double {
        let frequency: Double = 440 * pow(2, (midiNote - 69)/12)
        return frequency
    }
}
