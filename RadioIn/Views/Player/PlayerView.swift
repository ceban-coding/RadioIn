//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI
import SwiftAudioPlayer
import AVFoundation

struct PlayerView: View {
    var radio: RadioIn
    
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
                                let url = URL(string: "http://195.95.206.17/HitFM")!
                                SAPlayer.shared.startRemoteAudio(withRemoteUrl: url)
                                SAPlayer.shared.play()
                            }) {
                                Image("Play")
                                    .resizable()
                                    .frame(width: 175, height: 175)
                                    .scaledToFit()
                            }
                            .frame(width: 350, height: 175, alignment: .center)
                        }
                        .fixedSize()
                    }
                    Spacer()
                    animationView()
                    Spacer()
                    PlayerBar()                  
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Player")
        }
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(radio: radios[1])
    }
}
