//
//  AudioBox.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/10/21.
//

import AVFoundation
import MediaPlayer
import UIKit


class AudioBox: NSObject, ObservableObject {
    
    @Published var status: AudioStatus = .stopped
    
    var player = AVPlayer()
    var playerItem: AVPlayerItem!
    
    override init() {
        super.init()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleRouteChange), name: AVAudioSession.routeChangeNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleInteruption), name: AVAudioSession.interruptionNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleRouteChange(notification: Notification) {
        if let info = notification.userInfo,
           let rawValue = info[AVAudioSessionRouteChangeReasonKey] as? UInt {
            let reason = AVAudioSession.RouteChangeReason(rawValue: rawValue)
            if reason == .oldDeviceUnavailable {
                guard let previousRoute = info[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription,
                      let previousOutput = previousRoute.outputs.first else {
                    return
                }
                if previousOutput.portType == .headphones {
                    if status == .playing {
                        pause()
                    }
                }
            }
        }
    }
    
    @objc func handleInteruption(notification: Notification) {
        if let info = notification.userInfo,
           let rawValue = info[AVAudioSessionInterruptionTypeKey] as? UInt {
            let type = AVAudioSession.InterruptionType(rawValue: rawValue)
            if type == .began {
                if status == .playing {
                    pause()
                }  else {
                    if let rawValue = info[AVAudioSessionInterruptionOptionKey] as? UInt {
                        let options = AVAudioSession.InterruptionOptions(rawValue: rawValue)
                        if options == .shouldResume {
                            // restart audio or restart recording
                        }
                    }
                }
            }
        }
    }
    
    
    func initPlayer(url: String) {
        guard let url = URL.init(string: url) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        setupNowPlaying()
        setupRemoteTransportControls()
        playAudioBackground()
    }
    
    
    func playAudioBackground() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            //print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            //print("Session is Active")
        } catch {
            print(error)
        }
    }
    
    // Pause method for stoping music
    func pause(){
        player.pause()
        status = .stopped
    }
    // Play method for playing music
    func play() {
        player.play()
        status = .playing
    }
    
    
    // Setup notofications (player in notification screen)
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            print("Play command - is playing: \(self.player.isPlaying)")
            if !self.player.isPlaying {
                self.player.play()
                status = .playing
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            print("Pause command - is playing: \(self.player.isPlaying)")
            if self.player.isPlaying {
                self.player.pause()
                status = .stopped
                return .success
            }
            return .commandFailed
        }
    }
    
    
    // SetUp now playing information for plyer in notification screen
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


extension AudioBox: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        status = .stopped
    }
}
