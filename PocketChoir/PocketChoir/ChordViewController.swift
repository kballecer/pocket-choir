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



class ChordViewController: UIViewController {
    
    //Chord button outlets
    @IBOutlet weak var oneChordButton: UILabel!
    @IBOutlet weak var twoChordButton: UILabel!
    @IBOutlet weak var threeChordButton: UILabel!
    @IBOutlet weak var fourChordButton: UILabel!
    @IBOutlet weak var fiveChordButton: UILabel!
    @IBOutlet weak var sixChordButton: UILabel!
    @IBOutlet weak var sevenChordButton: UILabel!
    
    //imageview square button outlets
    @IBOutlet weak var oneChordImageButton: UIImageView!
    @IBOutlet weak var threeChordImageButton: UIImageView!
    @IBOutlet weak var twoChordImageButton: UIImageView!
    @IBOutlet weak var fourChordImageButton: UIImageView!
    @IBOutlet weak var fiveChordImageButton: UIImageView!
    @IBOutlet weak var sixChordImageButton: UIImageView!
    @IBOutlet weak var sevenChordImageButton: UIImageView!
    
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
    
    @IBOutlet weak var effectsScroll: UIScrollView!
    var effectSlides:[UIView] = [];
    var chordImageButtons:[UIImageView] = [];
    var keyImageButtons:[UIImageView] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(audioEngine == nil){
            audioEngine = AudioEngine()
        }
        effectSlides = createSlides()
        setupEffectSliders(EffectSlide: effectSlides)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.oneChordPresssed))
        oneChordButton.isUserInteractionEnabled = true
        oneChordButton.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.twoChordPresssed))
        twoChordButton.isUserInteractionEnabled = true
        twoChordButton.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.threeChordPresssed))
        threeChordButton.isUserInteractionEnabled = true
        threeChordButton.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.fourChordPresssed))
        fourChordButton.isUserInteractionEnabled = true
        fourChordButton.addGestureRecognizer(tap4)
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.fiveChordPresssed))
        fiveChordButton.isUserInteractionEnabled = true
        fiveChordButton.addGestureRecognizer(tap5)
        
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.sixChordPresssed))
        sixChordButton.isUserInteractionEnabled = true
        sixChordButton.addGestureRecognizer(tap6)
        
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.sevenChordPresssed))
        sevenChordButton.isUserInteractionEnabled = true
        sevenChordButton.addGestureRecognizer(tap7)
        
        
        let cTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.cPressed))
        cKey.isUserInteractionEnabled = true
        cKey.addGestureRecognizer(cTap)
        
        let cSharpTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.cSharpPressed))
        cSharpKey.isUserInteractionEnabled = true
        cSharpKey.addGestureRecognizer(cSharpTap)
        
        let dTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.dPressed))
        dKey.isUserInteractionEnabled = true
        dKey.addGestureRecognizer(dTap)
        
        let dSharpTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.dSharpPressed))
        dSharpKey.isUserInteractionEnabled = true
        dSharpKey.addGestureRecognizer(dSharpTap)
        
        let eTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.ePressed))
        eKey.isUserInteractionEnabled = true
        eKey.addGestureRecognizer(eTap)
        
        let fTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.fPressed))
        fKey.isUserInteractionEnabled = true
        fKey.addGestureRecognizer(fTap)
        
        let fSharpTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.fSharpPressed))
        fSharpKey.isUserInteractionEnabled = true
        fSharpKey.addGestureRecognizer(fSharpTap)
        
        let gTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.gPressed))
        gKey.isUserInteractionEnabled = true
        gKey.addGestureRecognizer(gTap)
        
        let gSharpTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.gSharpPressed))
        gSharpKey.isUserInteractionEnabled = true
        gSharpKey.addGestureRecognizer(gSharpTap)
        
        let aTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.aPressed))
        aKey.isUserInteractionEnabled = true
        aKey.addGestureRecognizer(aTap)
        
        let aSharpTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.aSharpPressed))
        aSharpKey.isUserInteractionEnabled = true
        aSharpKey.addGestureRecognizer(aSharpTap)
        
        let bTap = UITapGestureRecognizer(target: self, action: #selector(ChordViewController.bPressed))
        bKey.isUserInteractionEnabled = true
        bKey.addGestureRecognizer(bTap)
        
        //let chordImageButtons = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // clear previously highlighted chords when new chord pressed
    @objc func clearChordHighlights() {
        chordImageButtons = [oneChordImageButton, twoChordImageButton, threeChordImageButton, fourChordImageButton, fiveChordImageButton, sixChordImageButton, sevenChordImageButton]
        for button in chordImageButtons {
            button.isHighlighted = false;
        }
        
    }
    
    // clear previously highlighted keys when new key pressed
    @objc func clearKeyHighlights() {
        keyImageButtons = [cKey , cSharpKey, dKey, dSharpKey, eKey, fKey, fSharpKey, gKey, gSharpKey, aKey, aSharpKey, bKey]
        for button in keyImageButtons {
            button.isHighlighted = false;
        }
        
    }

    @objc func oneChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(1)
        clearChordHighlights()
        oneChordImageButton.isHighlighted = true
        print("1")
    }
    
    @objc func twoChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(2)
        clearChordHighlights()
        twoChordImageButton.isHighlighted = true
        print("2")
    }

    @objc func threeChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(3)
        clearChordHighlights()
        threeChordImageButton.isHighlighted = true
        print("3")
    }
    
    @objc func fourChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(4)
        clearChordHighlights()
        fourChordImageButton.isHighlighted = true
        print("4")
    }
    
    @objc func fiveChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(5)
        clearChordHighlights()
        fiveChordImageButton.isHighlighted = true
        print("5")
    }
    
    @objc func sixChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(6)
        clearChordHighlights()
        sixChordImageButton.isHighlighted = true
        print("6")
    }
    
    @objc func sevenChordPresssed(sender: UITapGestureRecognizer) {
        audioEngine.chord_update(7)
        clearChordHighlights()
        sevenChordImageButton.isHighlighted = true
        print("7")
    }
    
    @objc func cPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(0)
        clearKeyHighlights()
        cKey.isHighlighted = true
        print("c")
    }
    
    @objc func cSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(1)
        clearKeyHighlights()
        cSharpKey.isHighlighted = true
        print("c#")
    }
    
    @objc func dPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(2)
        clearKeyHighlights()
        dKey.isHighlighted = true
        print("d")
    }
    
    @objc func dSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(3)
        clearKeyHighlights()
        dSharpKey.isHighlighted = true
        print("d#")
    }
    
    @objc func ePressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(4)
        clearKeyHighlights()
        eKey.isHighlighted = true
        print("e")
    }
    
    @objc func fPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(5)
        clearKeyHighlights()
        fKey.isHighlighted = true
        print("f")
    }
    
    @objc func fSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(6)
        clearKeyHighlights()
        fSharpKey.isHighlighted = true
        print("f#")
    }
    
    @objc func gPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(7)
        clearKeyHighlights()
        gKey.isHighlighted = true
        print("g")
    }
    
    @objc func gSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(8)
        clearKeyHighlights()
        gSharpKey.isHighlighted = true
        print("g#")
    }
    
    @objc func aPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(9)
        clearKeyHighlights()
        aKey.isHighlighted = true
        print("a")
    }
    
    @objc func aSharpPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(10)
        clearKeyHighlights()
        aSharpKey.isHighlighted = true
        print("a#")
    }
    
    @objc func bPressed(sender: UITapGestureRecognizer) {
        audioEngine.lead_update(11)
        clearKeyHighlights()
        bKey.isHighlighted = true
        print("b")
    }
    
    func createSlides() -> [UIView] {
        let slide1:ReverbSlide = Bundle.main.loadNibNamed("ReverbSlide", owner: self, options: nil)?.first as! ReverbSlide
        
        let slide2:DelaySlide = Bundle.main.loadNibNamed("DelaySlide", owner: self, options: nil)?.first as! DelaySlide
        
        return [slide1, slide2]
    }
    
    func setupEffectSliders(EffectSlide : [UIView]) {
        effectsScroll.frame = CGRect(x: 0, y: 0, width: 411, height: 207)
        effectsScroll.contentSize = CGSize(width: 411 * EffectSlide.count, height: 207)
        effectsScroll.isPagingEnabled = false
        
        for i in 0 ..< EffectSlide.count {
            EffectSlide[i].frame = CGRect(x: 411 * CGFloat(i), y: 0, width: 411, height: 207)
            effectsScroll.addSubview(EffectSlide[i])
        }
    }
}

