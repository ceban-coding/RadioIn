//
//  PlayerBar.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/9/21.
//

import SwiftUI

struct PlayerBar: View {
    
    var radioPlayer = musicPlayer()
    @State var playerPaused : Bool = true
    
    var body: some View {
        ZStack {
            HStack {
            
                Button(action: {
                     self.playerPaused.toggle()
                     if self.playerPaused {
                       radioPlayer.pause()
                     }
                     else {
                       playStation()
                     }
                   }) {
                     Image( playerPaused ? "playButton" : "pausebar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                 }
                               
                Spacer()
                
                VStack {
                    HStack(alignment: .top) {
                        Text("Retro FM")
                            .font(.body)
                            .kerning(1.0)
                            .multilineTextAlignment(.center)
  
                        Text(Image(systemName:  "info.circle"))
                            .font(.caption)
                            .padding(.top, 2)
                    }
                    Text("Stopped")
                        .kerning(1.0)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .padding(5)
                Spacer()
                Button(action: {}) {
                    HeartView(isFilled: false)
                        .font(.title2)
                }
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .edgesIgnoringSafeArea(.all)
        .background(Color("playerBar"))
        .opacity(0.8)
        .onTapGesture {
            withAnimation(.easeIn) {
                
            }
        }
    }
    
    func playStation() {
        radioPlayer.initPlayer(url: "http://195.95.206.17/HitFM")
        radioPlayer.play()
    }
}


struct PlayerBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBar()
            .previewLayout(.sizeThatFits)
    }
}
