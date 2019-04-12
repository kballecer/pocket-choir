//
//  DelaySlide.swift
//  PocketChoir
//
//  Created by Chris on 4/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class DelaySlide: UIView {

    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var fbSlider: UISlider!
    @IBOutlet weak var dwSlider: UISlider!
    @IBOutlet weak var toggle: UISwitch!
    
    @IBAction func timeChange(_ sender: Any) {
        audioEngine.delay_timeUpdate(Double(timeSlider.value))
    }
    
    @IBAction func fbChange(_ sender: Any) {
        audioEngine.delay_fbUpdate(Double(fbSlider.value))
    }
    
    @IBAction func dwChange(_ sender: Any) {
        audioEngine.delay_dwMixUpdate(Double(dwSlider.value))
    }
    
    @IBAction func toggleChange(_ sender: Any) {
        audioEngine.delayOn = (toggle.isOn) ? true : false
    }
}
