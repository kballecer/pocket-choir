//
//  SampleViewController.swift
//  PocketChoir
//
//  Created by David on 4/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit


class SampleViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toggleRecording(_ sender: UIButton) {
        if audioEngine.sampler.recording {
            audioEngine.sampler.stop_recording()
            recordButton.titleLabel?.text = "Record"
        }
        else {
            audioEngine.sampler.start_recording()
            recordButton.titleLabel?.text = "Stop"
        }
    }
    @IBAction func togglePlaying(_ sender: UIButton) {
        if audioEngine.sampler.playing {
            audioEngine.sampler.stop_playing()
            playButton.titleLabel?.text = "Play"
        }
        else {
            audioEngine.sampler.start_playing()
            playButton.titleLabel?.text = "Stop"
        }
    }
}
