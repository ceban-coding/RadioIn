//
//  PlayerBar.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/9/21.
//

import SwiftUI

struct PlayerBar: View {
    @Binding var isPlaying: Bool
    //@State var playerPaused : Bool = true
   //@Binding var state: SwimplyPlayIndicator.AudioState
    
    var body: some View {
        
        ZStack {
            HStack {
                Button(action: {
                    self.isPlaying.toggle()
                    if self.isPlaying {
                        //self.state = .stop
                    }
                    else {
                        //self.state = .play
                    }
                }) {
                    Image( isPlaying ? "pausebar" : "playButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                }
                Spacer()
                
                ZStack {
                    VStack(alignment: .center) {
                        HStack(alignment: .top) {
                            Text("Retro FM")
                                .font(.body)
                                .multilineTextAlignment(.center)
                            Text(Image(systemName:  "info.circle"))
                                .font(.caption)
        
                        }
                        
                        Text( isPlaying ? "Playing" : "Stoped")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 2)
                        
                    }
                }
                Spacer()
                Button(action: {}) {
                    HeartView(isFilled: false)
                        .font(.system(size: 27))
                }
                
            }
            .padding(.leading)
            .padding(.trailing)
        }
        .background(Color.accentColor)
        .frame(height: 45)
    }
}


struct PlayerBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBar(isPlaying: .constant(false) )
            .previewLayout(.sizeThatFits)
    }
}
