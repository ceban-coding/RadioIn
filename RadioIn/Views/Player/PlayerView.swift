//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    var radio: RadioIn
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    StationRow(radio: radio)
                        .padding()
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    ZStack(alignment: .bottomLeading) {
                        Button(action: {}) {
                            HeartView(isFilled: false)
                                .font(.title)
                        }
                        Spacer()
                        HStack(alignment: .center) {
                            Button(action: {}) {
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
                    PlayerBar()
                        .opacity(0.7)
                    
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
