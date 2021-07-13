//
//  PlayerView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                StationRow(radio: radios[4])
                    .padding()
                
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
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
