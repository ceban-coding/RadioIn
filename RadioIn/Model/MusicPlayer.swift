//
//  MusicPlayer.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/21/21.
//

import Foundation
import AVFoundation
import MediaPlayer


class musicPlayer {
    public static var instance = musicPlayer()
    var player = AVPlayer()
    var playerItem: AVPlayerItem!
    
    func initPlayer(url: String) {
        
        guard let url = URL.init(string: url) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        playAudioBackground()
    }
    
    func playAudioBackground() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }
    
    
    func pause(){
        if player.isPlaying {
            player.pause()
        }
    }
    
    func play() {
        setupNowPlaying()
        setupRemoteTransportControls()
        player.play()
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.player.rate == 0.0 {
                self.player.play()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player.rate == 1.0 {
                self.player.pause()
                return .success
            }
            return .commandFailed
        }
    }
    
    func setupNowPlaying() {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = "Radio In"

        if let image = UIImage(named: "ri") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
            }
        }
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}


extension AVPlayer {
    
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
    
}
