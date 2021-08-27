//
//  MusicPlayer.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/21/21.
//
import AVFoundation
import MediaPlayer
import UIKit


class PlayerViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    
 
    var player = AVPlayer()
    var playerItem: AVPlayerItem!
    
    
// Initiate player
    func initPlayer(url: String) {
        isPlaying = true
        guard let url = URL.init(string: url) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        player.play()
        setupNowPlaying()
        setupRemoteTransportControls()
        setupNotifications()
        playAudioBackground()
    }
    
//    func loadRadio(radioURL: String) {
//
//            guard let url = URL.init(string: radioURL) else { return }
//            let playerItem = AVPlayerItem.init(url: url)
//            player = AVPlayer.init(playerItem: playerItem)
//            player.play()
//
//            isPlaying = true
//        }
    
    
    //Setup method for playing audio in background
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
    
    func pause(){
        isPlaying.toggle()
        player.pause()
    }
    
    func play() {
        isPlaying.toggle()
        player.play()
    }
    
//MARK: - Set notifications
    
    // Setup Notifications (present player in Notification screen)
    func setupRemoteTransportControls() {
      // Get the shared MPRemoteCommandCenter
      let commandCenter = MPRemoteCommandCenter.shared()
      
      // Add handler for Play Command
      commandCenter.playCommand.addTarget { [unowned self] event in
        print("Play command - is playing: \(self.player.isPlaying)")
        if !self.player.isPlaying {
          self.play()
          return .success
        }
        return .commandFailed
      }
      
      // Add handler for Pause Command
      commandCenter.pauseCommand.addTarget { [unowned self] event in
        print("Pause command - is playing: \(self.player.isPlaying)")
        if self.player.isPlaying {
          self.pause()
          return .success
        }
        return .commandFailed
      }
    }
    
    //Sete now playing method
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
    
   
    
    func setupNotifications() {
      let notificationCenter = NotificationCenter.default
      notificationCenter.addObserver(self,
                                     selector: #selector(handleInterruption),
                                     name: AVAudioSession.interruptionNotification,
                                     object: nil)
      notificationCenter.addObserver(self,
                                     selector: #selector(handleRouteChange),
                                     name: AVAudioSession.routeChangeNotification,
                                     object: nil)
    }
    
// MARK: - Handle Notifications
    
    @objc func handleRouteChange(notification: Notification) {
      guard let userInfo = notification.userInfo,
        let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
        let reason = AVAudioSession.RouteChangeReason(rawValue:reasonValue) else {
          return
      }
      switch reason {
      case .newDeviceAvailable:
        let session = AVAudioSession.sharedInstance()
        for output in session.currentRoute.outputs where output.portType == AVAudioSession.Port.headphones {
          print("headphones connected")
          DispatchQueue.main.sync {
            self.play()
          }
          break
        }
      case .oldDeviceUnavailable:
        if let previousRoute =
          userInfo[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription {
          for output in previousRoute.outputs where output.portType == AVAudioSession.Port.headphones {
            print("headphones disconnected")
            DispatchQueue.main.sync {
              self.pause()
            }
            break
          }
        }
      default: ()
      }
    }
    
    @objc func handleInterruption(notification: Notification) {
      guard let userInfo = notification.userInfo,
        let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
        let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
          return
      }
      
      if type == .began {
        print("Interruption began")
        // Interruption began, take appropriate actions
      }
      else if type == .ended {
        if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
          let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
          if options.contains(.shouldResume) {
            // Interruption Ended - playback should resume
            print("Interruption Ended - playback should resume")
            play()
          } else {
            // Interruption Ended - playback should NOT resume
            print("Interruption Ended - playback should NOT resume")
          }
        }
      }
    }
}


//MARK: - Extensions

extension AVPlayer {
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
    
}

