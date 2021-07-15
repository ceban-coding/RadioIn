//
//  PlayerBar.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/9/21.
//

import SwiftUI

struct PlayerBar: View {
    var body: some View {
        ZStack {
            HStack {
                Button(action: {}) {
                    Image("playButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                }
                
                Spacer()
                VStack {
                    HStack(alignment: .top) {
                        Text("Retro FM")
                            .font(.body)
                            .fontWeight(.medium)
                            .kerning(1.0)
                            .multilineTextAlignment(.center)
                            
                        
                        Text(Image(systemName:  "info.circle"))
                            .font(.caption)
                            .fontWeight(.medium)
                            .padding(.top, 2)
                    }
                    Text("Stopped")
                        .kerning(1.0)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .padding(5)
                Spacer()
                Button(action: {}) {
                    HeartView(isFilled: false)
                        .font(.title2)
                }
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .edgesIgnoringSafeArea(.all)
        .background(Color("playerBar"))
    }
}

struct PlayerBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBar()
            .previewLayout(.sizeThatFits)
    }
}
