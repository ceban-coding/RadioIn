//
//  MusicPlayer.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/21/21.
//

import Foundation
import AVFoundation

class musicPlayer {
    public static var instance = musicPlayer()
    var player = AVPlayer()
    
    func initPlayer(url: String) {
        
        guard let url = URL.init(string: url) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        playAudioBackground()
    }
    
    func playAudioBackground() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: .mixWithOthers)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
    }
    
    
    
    func pause(){
        player.pause()
    }
    
    func play() {
        player.play()
    }
}
