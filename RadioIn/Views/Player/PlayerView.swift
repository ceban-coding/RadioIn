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
   
    @State var radioPlayer =  musicPlayer()
    @State var isPlaying : Bool = false
  
    var body: some View {
        NavigationView {
            VStack {
                StationRow(radio: radio)
                    .padding()
                
                Spacer()
            
                VStack {
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            self.isPlaying.toggle()
                            if self.isPlaying {
                                playStation()
                                self.state = .play
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
                    
                    HStack(alignment: .center ) {
                        
                        Button(action: {
                        }) {
                            HeartView(isFilled: false)
                                .font(.title)
                        }
                        Spacer()
                        
                        Text( isPlaying ? "Playing.." : "Stopped")
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
                
                CategoryRow(radio: radio)
                PlayerBar()       
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
