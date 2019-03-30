//
//  ViewController.swift
//  PocketChoir
//
//  Created by David on 3/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

var audioEngine: AudioEngine!

class ViewController: UIViewController {
    
    @IBOutlet weak var oneChordButton: UILabel!
    @IBOutlet weak var twoChordButton: UILabel!
    @IBOutlet weak var threeChordButton: UILabel!
    @IBOutlet weak var fourChordButton: UILabel!
    @IBOutlet weak var fiveChordButton: UILabel!
    @IBOutlet weak var sixChordButton: UILabel!
    @IBOutlet weak var sevenChordButton: UILabel!
    
    
    @IBOutlet weak var cKey: UIImageView!
    @IBOutlet weak var cSharpKey: UIImageView!
    @IBOutlet weak var dKey: UIImageView!
    @IBOutlet weak var dSharpKey: UIImageView!
    @IBOutlet weak var eKey: UIImageView!
    @IBOutlet weak var fKey: UIImageView!
    @IBOutlet weak var fSharpKey: UIImageView!
    @IBOutlet weak var gKey: UIImageView!
    @IBOutlet weak var gSharpKey: UIImageView!
    @IBOutlet weak var aKey: UIImageView!
    @IBOutlet weak var aSharpKey: UIImageView!
    @IBOutlet weak var bKey: UIImageView!
    
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
        
        
        let cTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.cPressed))
        cKey.isUserInteractionEnabled = true
        cKey.addGestureRecognizer(cTap)
        
        let cSharpTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.cSharpPressed))
        cSharpKey.isUserInteractionEnabled = true
        cSharpKey.addGestureRecognizer(cSharpTap)
        
        let dTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dPressed))
        dKey.isUserInteractionEnabled = true
        dKey.addGestureRecognizer(dTap)
        
        let dSharpTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dSharpPressed))
        dSharpKey.isUserInteractionEnabled = true
        dSharpKey.addGestureRecognizer(dSharpTap)
        
        let eTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ePressed))
        eKey.isUserInteractionEnabled = true
        eKey.addGestureRecognizer(eTap)
        
        let fTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.fPressed))
        fKey.isUserInteractionEnabled = true
        fKey.addGestureRecognizer(fTap)
        
        let fSharpTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.fSharpPressed))
        fSharpKey.isUserInteractionEnabled = true
        fSharpKey.addGestureRecognizer(fSharpTap)
        
        let gTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.gPressed))
        gKey.isUserInteractionEnabled = true
        gKey.addGestureRecognizer(gTap)
        
        let gSharpTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.gSharpPressed))
        gSharpKey.isUserInteractionEnabled = true
        gSharpKey.addGestureRecognizer(gSharpTap)
        
        let aTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.aPressed))
        aKey.isUserInteractionEnabled = true
        aKey.addGestureRecognizer(aTap)
        
        let aSharpTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.aSharpPressed))
        aSharpKey.isUserInteractionEnabled = true
        aSharpKey.addGestureRecognizer(aSharpTap)
        
        let bTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.bPressed))
        bKey.isUserInteractionEnabled = true
        bKey.addGestureRecognizer(bTap)
        
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
    
    @objc func cPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(0)
        print("c")
    }
    
    @objc func cSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(1)
        print("c#")
    }
    
    @objc func dPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(2)
        print("d")
    }
    
    @objc func dSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(3)
        print("d#")
    }
    
    @objc func ePressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(4)
        print("e")
    }
    
    @objc func fPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(5)
        print("f")
    }
    
    @objc func fSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(6)
        print("f#")
    }
    
    @objc func gPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(7)
        print("g")
    }
    
    @objc func gSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(8)
        print("g#")
    }
    
    @objc func aPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(9)
        print("a")
    }
    
    @objc func aSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(10)
        print("a#")
    }
    
    @objc func bPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(11)
        print("b")
    }
}

