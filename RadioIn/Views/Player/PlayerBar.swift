//
//  PlayerBar.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/9/21.
//

import SwiftUI

struct PlayerBar: View {
    @State var isSet: Bool = false
    @State var isPlaying : Bool = false
    @State var state : SwimplyPlayIndicator.AudioState = .stop
    

    var body: some View {
        
        ZStack {
            HStack {
                Button(action: {
                    if isPlaying {
                        self.state = .play
                        
                    } else  {
                        self.state = .stop
                       
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
                        HStack(alignment: .top, spacing: 5) {
                            Text("Diaspora")
                                .font(.body)
                                .multilineTextAlignment(.center)
                            Text(Image(systemName: "info.circle"))
                                .font(.caption)
                        }

                        Text( isPlaying ? "Playing" : "Stoped")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            
                    }
                }

                .opacity(0.8)
                
                Spacer()
                FavoriteButton(isSet: $isSet)
            }
            .padding(.leading)
            .padding(.trailing)
        }
        //.padding(5)
        .frame(height: 45)
        .background(Color.accentColor)
    }
}


struct PlayerBar_Previews: PreviewProvider {
 
    
    static var previews: some View {
        PlayerBar()
            .previewLayout(.sizeThatFits)
    }
}
