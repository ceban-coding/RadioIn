//
//  PlayerBar.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/9/21.
//

import SwiftUI

struct PlayerBar: View {
    @State var playerPaused : Bool = true
    @State var state: SwimplyPlayIndicator.AudioState = .stop
    
    var body: some View {
       
        
        ZStack {
            
            Blur(style:.dark)
            HStack {
                Button(action: {
                    self.playerPaused.toggle()
                    if self.playerPaused {
                        
                        self.state = .stop
                    }
                    else {
                       
                        self.state = .play
                    }
                }) {
                    Image( playerPaused ? "playButton" : "pausebar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                Spacer()
                
                VStack(alignment: .center) {
                    HStack(alignment: .top) {
                        Text("Retro FM")
                            .font(.body)
                            .multilineTextAlignment(.center)
                        
                        Text(Image(systemName:  "info.circle"))
                            .font(.caption)
                        
                    }
   
                    Text( playerPaused ? "Stopped" : "Playing")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 2)
                   
                }
                .padding(.init(top: 2, leading: 20, bottom: 0, trailing: 0))
                
                
                ZStack {
                    SwimplyPlayIndicator(state: self.$state, color: .green)
                        .frame(width: 25, height: 25)
                        .opacity(0.7)
                }
                
                
                Spacer()
                
                Button(action: {}) {
                    HeartView(isFilled: false)
                        .font(.title)
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
        .background(Color("playerBar"))
        .frame(height: 45)
    }
}


struct PlayerBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBar()
            .previewLayout(.sizeThatFits)
    }
}
