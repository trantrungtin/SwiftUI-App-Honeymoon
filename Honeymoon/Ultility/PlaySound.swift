//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Tin Tran on 19/06/2022.
//

import AVFoundation

private var audioPlayer: AVAudioPlayer?

private func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file")
        }
    }
}

func playClickSound() {
    playSound(sound: "sound-click", type: "mp3")
}

func playRiseSound() {
    playSound(sound: "sound-rise", type: "mp3")
}
