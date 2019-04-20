//
//  Sampler.swift
//  PocketChoir
//
//  Created by David on 4/17/19.
//  Copyright © 2019 Pocket Choir. All rights reserved.
//

import AudioKit


class Sampler: AKNode {
    
    var recorder: AKNodeRecorder!
    var sample: AKAudioFile!
    var sample_player: AKAudioPlayer!
    var harmonizer: Harmonizer!
    
    var recording = false
    var playing  = false
    
    
    init(_ input: AKNode) {
        
        recording = false
        playing = false
        
        AKAudioFile.cleanTempDirectory()
        
        recorder = try? AKNodeRecorder(node: input)

        if let file = recorder.audioFile {
            sample_player = try? AKAudioPlayer(file: file)
        }
        sample_player.looping = true
        
        harmonizer = Harmonizer(sample_player)
        
        
        
        super.init()
        self.avAudioNode = harmonizer.avAudioNode
    }
    
    func start_recording() {
        recording = true
        
        do {
            try recorder.reset()
        } catch {
            print("couldn't reset")
        }
        
        do {
            try recorder.record()
        } catch {
            print("error recording")
        }
    }
    
    func stop_recording() {
        
        recording = false
        do {
            try sample_player.reloadFile()
        } catch {
            print("error reloading")
        }
        
        let recordedDuration = sample_player != nil ? sample_player.audioFile.duration : 0
        
        if recordedDuration > 0.0 {
            recorder.stop()
            sample_player.audioFile.exportAsynchronously(name: "sample.m4a", baseDir: .documents, exportFormat: .m4a) {_, exportError in
                
                if let error = exportError {
                    print("export failed \(error)")
                } else {
                    print("export succeeded")
                }
            }
        }
        
        sample = sample_player.audioFile
    }
    
    func start_playing() {
        playing = true
        sample_player.play()
    }
    
    func stop_playing() {
        playing = false
        sample_player.stop()
    }
    
}
