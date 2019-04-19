//
//  HarmonizedVolumeSlide.swift
//  PocketChoir
//
//  Created by Kevin Ballecer on 4/19/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class HarmonizedVolumeSlide: UIView {
    
    @IBOutlet weak var harm_volumeSlider: UISlider!
    
    @IBAction func harm_volChange(_ sender: Any) {
        audioEngine.change_harmonizeGain(Double(harm_volumeSlider.value))
    }
}
