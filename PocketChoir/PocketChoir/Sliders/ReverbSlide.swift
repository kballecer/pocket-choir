//
//  EffectSlide.swift
//  PocketChoir
//
//  Created by Chris on 4/11/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class ReverbSlide: UIView {
    
    @IBOutlet weak var feedback: UISlider!
    @IBOutlet weak var toggle: UISwitch!
    
    @IBAction func toggleReverb(_ sender: Any) {
        audioEngine.reverbOn = (toggle.isOn) ? true : false
    }
    
    @IBAction func changeFB(_ sender: Any) {
        audioEngine.reverb_fbUpdate(Double(feedback.value))
    }
}
