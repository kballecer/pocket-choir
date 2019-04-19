//
//  InputVolumeSlide.swift
//  PocketChoir
//
//  Created by Kevin Ballecer on 4/19/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class InputVolumeSlide: UIView {
    
    @IBOutlet weak var input_volumeSlider: UISlider!
    
    @IBAction func input_volChange(_ sender: Any) {
        audioEngine.change_inputGain(Double(input_volumeSlider))
    }
}
