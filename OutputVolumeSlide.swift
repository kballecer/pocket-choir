//
//  OutputVolumeSlide.swift
//  PocketChoir
//
//  Created by Kevin Ballecer on 4/19/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class OutputVolumeSlide: UIView {
    
    @IBOutlet weak var output_volumeSlider: UISlider!

    @IBAction func output_volChange(_ sender: Any) {
        audioEngine.change_outputGain(Double(output_volumeSlider.value))
    }
}
