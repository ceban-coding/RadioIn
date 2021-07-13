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
                    (Text("Retro FM ") + Text(Image(systemName:  "info.circle")))
                        .kerning(1.0)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    
                    Text("Stopped")
                        .kerning(1.0)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    
                }
                .padding(5)
                Spacer()
                Button(action: {}) {
                    HeartView(isFilled: false)
                        .font(.title)
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
