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
    
    /*func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/
    
}
