//
//  SettingsViewController.swift
//  PocketChoir
//
//  Created by David on 4/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var inputVolumeSlider: UISlider!
    @IBOutlet weak var sampleVolumeSlider: UISlider!
    @IBOutlet weak var wetVolumeSlider: UISlider!
    @IBOutlet weak var dryVolumeSlider: UISlider!
    @IBOutlet weak var outputVolumeSlider: UISlider!
    @IBOutlet weak var tonicNoteSlider: UISlider!
    @IBOutlet weak var windowSizeSlider: UISlider!
    @IBOutlet weak var crossfadeSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func inputSliderChanged(_ sender: UISlider) {
        audioEngine.input_booster.gain = Double(sender.value)
    }
    @IBAction func sampleSliderChanged(_ sender: UISlider) {
        audioEngine.sample_booster.gain = Double(sender.value)
    }
    @IBAction func wetSliderChanged(_ sender: UISlider) {
        
    }
    @IBAction func drySliderChanged(_ sender: UISlider) {
    
    }
    @IBAction func outputSliderChanged(_ sender: UISlider) {
        audioEngine.output_mix.volume = Double(sender.value)
    }
    @IBAction func tonicSliderChanged(_ sender: UISlider) {
        audioEngine.harmonizer.tonic = Double(sender.value)
        audioEngine.sampler.harmonizer.tonic = Double(sender.value)
    }
    @IBAction func windowSliderChanged(_ sender: UISlider) {
        audioEngine.harmonizer.setWindowSize(Double(sender.value))
        audioEngine.sampler.harmonizer.setWindowSize(Double(sender.value))
    }
    @IBAction func crossfadeSliderChanged(_ sender: UISlider) {
        audioEngine.harmonizer.setCrossfade(Double(sender.value))
        audioEngine.sampler.harmonizer.setCrossfade(Double(sender.value))
    }
}
