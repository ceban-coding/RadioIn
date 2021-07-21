//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI
import SwiftAudioPlayer

struct PlayerView: View {
    var radio: RadioIn
    @State var isPlaying : Bool = false
    
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
                                self.isPlaying.toggle()
                                playStation()
                            }
                            
                            , label: {
                                if isPlaying {
                                    Image("pause")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350, height: 175, alignment: .center)
                                } else {
                                    Image("Play")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350, height: 175, alignment: .center)
                                }
                            })
                        }
                        
                        .fixedSize()
                    }
                    
                    Spacer()
                    
                    Spacer()
                    PlayerBar()                  
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Player")
        }
    }
   
    func playStation() {
        guard let url = URL(string: "http://nashe.streamr.ru/nashe-128.mp3") else {
            print("Invalid URL")
            return
        }
        SAPlayer.shared.startRemoteAudio(withRemoteUrl: url)
        SAPlayer.shared.play()
    }
    
    
    
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(radio: radios[1])
    }
}
