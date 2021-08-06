//
//  PlayButton.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/6/21.
//

import SwiftUI

struct PlayButton: View {
    //@State var state: SwimplyPlayIndicator.AudioState = .stop
    var radio: RadioStation
    @State var radioPlayer =  musicPlayer()
    @Binding var isPlaying: Bool
    @Binding var state: SwimplyPlayIndicator.AudioState
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
            if self.isPlaying {
                self.state = .play
                playStation()
            }
            else {
                radioPlayer.pause()
                self.state = .stop
            }
        }) {
            Image( isPlaying ? "pause" : "Play")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 160, maxHeight: 160)
        }
    }
    
    func playPressed() {
        if self.isPlaying {
            self.state = .play
            playStation()
        }
        else {
            radioPlayer.pause()
            self.state = .stop
        }
    }
    
    func playStation() {
        radioPlayer.initPlayer(url: radio.urlString)
        radioPlayer.play()
    }
    
}

