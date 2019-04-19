//
//  PocketChoirTests.swift
//  PocketChoirTests
//
//  Created by David on 3/12/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import XCTest
@testable import PocketChoir

var audioEngine: AudioEngine!

class PocketChoirTests: XCTestCase {
    
    // Called before running all tests, setup code for all tests
    override class func setUp() {
        super.setUp()
        audioEngine = AudioEngine()
    }
    
    override func setUp() {
            // Setup code for before the invocation of each test method
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReverbFB() {
        audioEngine.reverb_fbUpdate(20)
        XCTAssertEqual(audioEngine.reverb.feedback, 0.2, "reverb_fbUpdate failed to update feedback parameter in reverb node")
    }
    
   func testDelayFB() {
        audioEngine.delay_fbUpdate(40)
        XCTAssertEqual(audioEngine.delay.feedback, 0.4, "delay_fbUpdate failed to updtaet feedback parameter in delay node")
    }
    
    func testDelayTime() {
        audioEngine.delay_timeUpdate(50)
        XCTAssertEqual(audioEngine.delay.time, 0.5, "delay_timeUpdate failed to update time parameter in delay node")
    }
    
    func testDelayDW() {
        audioEngine.delay_dwMixUpdate(60)
        XCTAssertEqual(audioEngine.delay.dryWetMix, 0.6, "delay_dwMixUpdate failed to update d/w parameter in delay node")
    }
    
    func testLeadChanges() {
        for i in 0...12 {
            audioEngine.lead_update(Double(i))
            XCTAssertEqual(Double(i), audioEngine.target_pitch.value(), "Target pitch incorrect")
        }
    }
    
    func testChordChanges() {
        audioEngine.chord_update(1)
        XCTAssertEqual(audioEngine.one_chord, audioEngine.target_chord, "Target chord incorrect")
        
        audioEngine.chord_update(2)
        XCTAssertEqual(audioEngine.two_chord, audioEngine.target_chord, "Target chord incorrect")
        
        audioEngine.chord_update(3)
        XCTAssertEqual(audioEngine.three_chord, audioEngine.target_chord, "Target chord incorrect")
        
        audioEngine.chord_update(4)
        XCTAssertEqual(audioEngine.four_chord, audioEngine.target_chord, "Target chord incorrect")
        
        audioEngine.chord_update(5)
        XCTAssertEqual(audioEngine.five_chord, audioEngine.target_chord, "Target chord incorrect")
        
        audioEngine.chord_update(6)
        XCTAssertEqual(audioEngine.six_chord, audioEngine.target_chord, "Target chord incorrect")
        
        audioEngine.chord_update(7)
        XCTAssertEqual(audioEngine.seven_chord, audioEngine.target_chord, "Target chord incorrect")
        
    }
    
}
