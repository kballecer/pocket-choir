//
//  controlViewController.swift
//  PocketChoir
//
//  Created by David on 4/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func createSlides() -> [UIView] {
        let slide1:HarmonizedVolumeSlide = Bundle.main.loadNibNamed("HarmonizedVolumeSlide", owner: self, options: nil)?.first as! HarmonizedVolumeSlide
        
        let slide2:InputVolumeSlide = Bundle.main.loadNibNamed("InputVOlumeSlide", owner: self, options: nil)?.first as! InputVolumeSlide
        
        let slide3:OutputVolumeSlide = Bundle.main.loadNibNamed("OutputVolumeSlide", owner: self, options: nil)?.first as! OutputVolumeSlide
        
        return [slide1, slide2, slide3]
    }
    
    /*func setupEffectSliders(EffectSlide : [UIView]) {
        effectsScroll.frame = CGRect(x: 0, y: 0, width: 411, height: 207)
        effectsScroll.contentSize = CGSize(width: 411 * EffectSlide.count, height: 207)
        effectsScroll.isPagingEnabled = false
        
        for i in 0 ..< EffectSlide.count {
            EffectSlide[i].frame = CGRect(x: 411 * CGFloat(i), y: 0, width: 411, height: 207)
            effectsScroll.addSubview(EffectSlide[i])
        }
    }*/
    
}
