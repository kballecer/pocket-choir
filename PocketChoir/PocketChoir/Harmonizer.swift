//
//  Harmonizer.swift
//  PocketChoir
//
//  Created by David on 3/26/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import Foundation
import AudioKit

class Harmonizer: AKNode {

    var freq_tracker: AKFrequencyTracker!
    var shifter1: AKPitchShifter!
    var shifter2: AKPitchShifter!
    var shifter3: AKPitchShifter!
    var shifter4: AKPitchShifter!
    var shifters: [AKPitchShifter]!
    var lead_shifter: AKPitchShifter!
    
    var shift1: Double = 0
    var shift2: Double = 0
    var shift3: Double = 0
    var shift4: Double = 0
    var lead_shift: Double = 0
    
    var current_note: Double = 60
    
    var lead_note: Double = 0
    var tonic: Double
//    var one: Double = 0
//    var two: Double = 2
//    var three: Double = 4
//    var four: Double = 6
//    var five: Double = 7
//    var six: Double = 9
//    var seven: Double = 11
//    var eight: Double = 12
    
    var chord_degree: Double
    var current_chord: [Double]
    let one_chord: [Double] = [-12, 0, 4, 7]
    let two_chord: [Double] = [-10, 2, 5, 9]
    let three_chord: [Double] = [-8, 4, 7, 11]
    let four_chord: [Double] = [-7, 5, 9, 12]
    let five_chord: [Double] = [-5, 7, 11, 14]
    let six_chord: [Double] = [-3, 9, 12, 16]
    let seven_chord: [Double] = [-1, 11, 14, 16]
    let eight_chord: [Double] = [0, 12, 16, 19]
    
    
    init(_ input: AKNode) {
        
        freq_tracker = AKFrequencyTracker(input)
        
        chord_degree = 1
        current_chord = one_chord
        shifter1 = AKPitchShifter(freq_tracker)
//        shifter2 = AKPitchShifter(input)
//        shifter3 = AKPitchShifter(input)
//        shifter4 = AKPitchShifter(input)
//        shifters = [shifter1, shifter2, shifter3, shifter4]
//        lead_shifter = AKPitchShifter(input)
        tonic = 60.0
        
        
        super.init()
        setOutput(to: shifter1)
    }
    
    func chord_update(_ chord_pressed: Double) {
        switch chord_pressed {
        case 1:
            current_chord = one_chord
            break
        case 2:
            current_chord = two_chord
            break
        case 3:
            current_chord = three_chord
            break
        case 4:
            current_chord = four_chord
            break
        case 5:
            current_chord = five_chord
            break
        case 6:
            current_chord = six_chord
            break
        case 7:
            current_chord = seven_chord
            break
        case 8:
            current_chord = eight_chord
            break
        default:
            print("problem in chord switch")
            break
        }
    }
    
    func update() {
        //current_note = ftom(freq_tracker.frequency)
        
        
        
        shift1 = (tonic + current_chord[0]) - current_note
        shift2 = (tonic + current_chord[1]) - current_note
        shift3 = (tonic + current_chord[2]) - current_note
        shift4 = (tonic + current_chord[3]) - current_note
        lead_shift = (tonic + lead_note) - current_note
        
        shifter1.shift = shift1
//        shifter2.shift = shift2
//        shifter3.shift = shift3
//        shifter4.shift = shift4
//        lead_shifter.shift = lead_shift
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
