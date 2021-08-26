//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct PlayerView: View {
    @State var isSet: Bool = false
    @State var state: SwimplyPlayIndicator.AudioState = .stop
    @EnvironmentObject var network : RadioAPI
    @StateObject var player = PlayerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//                StationRow(radio: network.stations[1])
//                    .padding()
                Spacer()
                VStack {
                    HStack(alignment: .center) {
                        Button(action: {
                            
                        }) {
                            Image(player.isPlaying ? "pause" : "Play")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 160, maxHeight: 160)
                        }
                    }
                    
                    HStack(alignment: .center ) {
                        
                        FavoriteButton(isSet: $isSet)
                        Spacer()
                        
                        Text( player.isPlaying ? "Playing" : "Stopped")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .opacity(0.6)
                        
                        Spacer()
                        SwimplyPlayIndicator(state: self.$state, color: .white)
                            
                            .frame(width: 30, height: 30)
                            .opacity(0.7)
                    }
                    .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                }
                Spacer()
                
                //CategoryRow(radio: radio)
                
            }
            .padding(.bottom, 50)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Player")
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerView()
            
    }
}
