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
    
    //Chord button outlets
    @IBOutlet weak var oneChordButton: UILabel!
    @IBOutlet weak var twoChordButton: UILabel!
    @IBOutlet weak var threeChordButton: UILabel!
    @IBOutlet weak var fourChordButton: UILabel!
    @IBOutlet weak var fiveChordButton: UILabel!
    @IBOutlet weak var sixChordButton: UILabel!
    @IBOutlet weak var sevenChordButton: UILabel!
    
    //Imageview square button outlets
    @IBOutlet weak var oneChordImageButton: UIImageView!
    @IBOutlet weak var twoChordImageButton: UIImageView!
    @IBOutlet weak var threeChordImageButton: UIImageView!
    @IBOutlet weak var fourChordImageButton: UIImageView!
    @IBOutlet weak var fiveChordImageButton: UIImageView!
    @IBOutlet weak var sixChordImageButton: UIImageView!
    @IBOutlet weak var sevenChordImageButton: UIImageView!
    
    //7th & sus square button outlets
    @IBOutlet weak var majorImageButton: UIImageView!
    @IBOutlet weak var minorImageButton: UIImageView!
    @IBOutlet weak var noneImageButton: UIImageView!
    @IBOutlet weak var fourSusImageButton: UIImageView!
    @IBOutlet weak var threeSusImageButton: UIImageView!
    @IBOutlet weak var twoSusImageButton: UIImageView!
    
    //Reverb button outlets
    @IBOutlet weak var reverbOn: UIButton!
    @IBOutlet weak var reverbOff: UIButton!
    
    //Keyboard key outlets
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
    
    @IBAction func reverbOnTap(_ sender: Any) {
        reverbOnPressed()
    }
    
    @IBAction func reverbOffTap(_ sender: Any) {
        reverbOffPressed()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func oneChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(1)
        oneChordImageButton.isHighlighted = !oneChordImageButton.isHighlighted
        print("1")
    }
    
    @objc func twoChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(2)
        twoChordImageButton.isHighlighted = !twoChordImageButton.isHighlighted
        print("2")
    }

    @objc func threeChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(3)
        threeChordImageButton.isHighlighted = !threeChordImageButton.isHighlighted
        print("3")
    }
    
    @objc func fourChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(4)
        fourChordImageButton.isHighlighted = !fourChordImageButton.isHighlighted
        print("4")
    }
    
    @objc func fiveChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(5)
        fiveChordImageButton.isHighlighted = !fiveChordImageButton.isHighlighted
        print("5")
    }
    
    @objc func sixChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(6)
        sixChordImageButton.isHighlighted = !sixChordImageButton.isHighlighted
        print("6")
    }
    
    @objc func sevenChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(7)
        sevenChordImageButton.isHighlighted = !sevenChordImageButton.isHighlighted
        print("7")
    }
    
    @objc func cPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(0)
        cKey.isHighlighted = !cKey.isHighlighted
        print("c")
    }
    
    @objc func cSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(1)
        cSharpKey.isHighlighted = !cSharpKey.isHighlighted
        print("c#")
    }
    
    @objc func dPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(2)
        dKey.isHighlighted = !dKey.isHighlighted
        print("d")
    }
    
    @objc func dSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(3)
        dSharpKey.isHighlighted = !dSharpKey.isHighlighted
        print("d#")
    }
    
    @objc func ePressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(4)
        eKey.isHighlighted = !eKey.isHighlighted
        print("e")
    }
    
    @objc func fPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(5)
        fKey.isHighlighted = !fKey.isHighlighted
        print("f")
    }
    
    @objc func fSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(6)
        fSharpKey.isHighlighted = !fSharpKey.isHighlighted
        print("f#")
    }
    
    @objc func gPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(7)
        gKey.isHighlighted = !gKey.isHighlighted
        print("g")
    }
    
    @objc func gSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(8)
        gSharpKey.isHighlighted = !gSharpKey.isHighlighted
        print("g#")
    }
    
    @objc func aPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(9)
        aKey.isHighlighted = !aKey.isHighlighted
        print("a")
    }
    
    @objc func aSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(10)
        aSharpKey.isHighlighted = !aSharpKey.isHighlighted
        print("a#")
    }
    
    @objc func bPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(11)
        bKey.isHighlighted = !bKey.isHighlighted
        print("b")
    }
    
    @objc func reverbOnPressed() {
        audioEngine.reverb_fbUpdate(0.85)
    }
    
    @objc func reverbOffPressed() {
        audioEngine.reverb_fbUpdate(0)
    }
}

