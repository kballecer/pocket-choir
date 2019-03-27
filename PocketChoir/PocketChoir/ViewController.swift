//
//  ViewController.swift
//  PocketChoir
//
//  Created by David on 3/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit
import AudioKit

var audioEngine: AudioEngine!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AudioEngine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

