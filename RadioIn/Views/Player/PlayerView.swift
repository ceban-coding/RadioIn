//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct PlayerView: View {

    var radio: RadioIn
    
    @State var playerPaused : Bool = true
    
    let radioPlayer = musicPlayer()
    
    var body: some View {
      
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    StationRow(radio: radio)
                        .padding()
                    
                    Spacer()
                    
                    ZStack(alignment: .bottomLeading) {
                        Button(action: {
                        }) {
                            HeartView(isFilled: false)
                                .font(.title)
                        }
                        
                        Spacer()
        
                        HStack(alignment: .center) {
                            Button(action: {
                                 self.playerPaused.toggle()
                                 if self.playerPaused {
                                   radioPlayer.pause()
                                 }
                                 else {
                                   playStation()
                                 }
                               }) {
                                 Image( playerPaused ? "Play" : "pause")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350, height: 175)
                             }
                        }
                    }
                    Spacer()
                    
                    PlayerBar()                  
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Player")
        }
    }
    
    func playStation() {
        radioPlayer.initPlayer(url: "http://rusradio.hostingradio.ru/rusradio96.aacp")
        radioPlayer.play()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(radio: radios[1])
    }
}
