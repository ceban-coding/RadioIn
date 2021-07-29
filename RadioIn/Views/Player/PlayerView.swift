//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct PlayerView: View {
    @State var state: SwimplyPlayIndicator.AudioState = .stop
    var radio: RadioStation
    @State var playerPaused : Bool = true
    let radioPlayer = musicPlayer()
    
    
    var body: some View {
        NavigationView {
            VStack {
                StationRow(radio: radio)
                    .padding()
                
                Spacer()
                Spacer()
                
                VStack {
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            self.playerPaused.toggle()
                            if self.playerPaused {
                                radioPlayer.pause()
                                self.state = .stop
                            }
                            else {
                                playStation()
                                self.state = .play
                            }
                        }) {
                            Image( playerPaused ? "Play" : "pause")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 180, maxHeight: 180)
                                
                        }
                        
                    }
                    
                    HStack(alignment: .center ) {
                       
                            Button(action: {
                            }) {
                                HeartView(isFilled: false)
                                    .font(.title)
                            }
                         Spacer()
                        
                        Text( playerPaused ? "Stopped" : "Playing..")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            
                        Spacer()
                        SwimplyPlayIndicator(state: self.$state, color: .green)
                                    .frame(width: 35, height: 30)
                    }
                    .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                    
                    
                }
                
                Spacer()
                Spacer()
                VStack {
                    CategoryRow(radio: radio)
                        .padding(.bottom)
                    PlayerBar()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Player")
        }
    }
    
    
    func playStation() {
        radioPlayer.initPlayer(url: radio.urlString)
        radioPlayer.play()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(radio: radios[1])
    }
}
