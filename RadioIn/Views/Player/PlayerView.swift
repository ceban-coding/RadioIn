//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct PlayerView: View {
    var radio: RadioStation
    @State var state: SwimplyPlayIndicator.AudioState = .stop
    @Binding var isPlaying : Bool 
  
    var body: some View {
        NavigationView {
            VStack {
                StationRow(radio: radio, isPlaying: $isPlaying)
                        .padding()
                    Spacer()
                    VStack {
                        HStack(alignment: .center) {
                           
                            PlayButton(radio: radio, isPlaying: $isPlaying, state: $state)
                        }
                
                        HStack(alignment: .center ) {
                            
                            Button(action: {
                            }) {
                                HeartView(isFilled: false)
                                    .font(.title)
                            }
                            Spacer()
                            
                            Text( isPlaying ? "Playing" : "Stopped")
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
                    
                    CategoryRow(radio: radio)
                        
                }
            .padding(.bottom, 50)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Player")
        }
        
    }
    
   
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(radio: radios[1], isPlaying: .constant(false))
    }
}
