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

    @IBOutlet weak var oneChordButton: UILabel!
    @IBOutlet weak var twoChordButton: UILabel!
    @IBOutlet weak var threeChordButton: UILabel!
    @IBOutlet weak var fourChordButton: UILabel!
    @IBOutlet weak var fiveChordButton: UILabel!
    @IBOutlet weak var sixChordButton: UILabel!
    @IBOutlet weak var sevenChordButton: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AudioEngine()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.oneChordPresssed))
        oneChordButton.isUserInteractionEnabled = true
        oneChordButton.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.twoChordPresssed))
        twoChordButton.isUserInteractionEnabled = true
        twoChordButton.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.threeChordPresssed))
        threeChordButton.isUserInteractionEnabled = true
        threeChordButton.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.fourChordPresssed))
        fourChordButton.isUserInteractionEnabled = true
        fourChordButton.addGestureRecognizer(tap4)
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.fiveChordPresssed))
        fiveChordButton.isUserInteractionEnabled = true
        fiveChordButton.addGestureRecognizer(tap5)
        
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.sixChordPresssed))
        sixChordButton.isUserInteractionEnabled = true
        sixChordButton.addGestureRecognizer(tap6)
        
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.sevenChordPresssed))
        sevenChordButton.isUserInteractionEnabled = true
        sevenChordButton.addGestureRecognizer(tap7)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func oneChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(1)
        print("1")
    }
    
    @objc func twoChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(2)
        print("2")
    }

    @objc func threeChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(3)
        print("3")
    }
    
    @objc func fourChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(4)
        print("4")
    }
    
    @objc func fiveChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(5)
        print("5")
    }
    
    @objc func sixChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(6)
        print("6")
    }
    
    @objc func sevenChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(7)
        print("7")
    }
}

