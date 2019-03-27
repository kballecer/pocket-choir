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
    
    init(input: AKNode) {
        
        
        freq_tracker = AKFrequencyTracker(input)
        
        shifter1 = AKPitchShifter(freq_tracker)
        shifter2 = AKPitchShifter(freq_tracker)
        shifter3 = AKPitchShifter(freq_tracker)
        shifter4 = AKPitchShifter(freq_tracker)
        
        super.init()
    }
    
    func update() {
        
    }

}
