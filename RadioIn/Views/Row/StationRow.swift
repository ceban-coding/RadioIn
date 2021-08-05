//
//  StationRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct StationRow: View {
     var radio: RadioStation
    @State var radioPlayer =  musicPlayer()
    @State var isLoading = false
    
    @State var tapped = false
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded {
                _ in self.tapped = !self.tapped
                startFakeNetworkRequest()
            }
    }
    
    var body: some View {
        
        ZStack {
            HStack {
                ArtWorkView(image: radio.image)
                        .frame(width: 65, height: 65)
                        .aspectRatio(contentMode: .fill)
                    
                        
                    VStack(alignment: .leading, spacing: 5) {
                        Text(radio.title)
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        
                        Text(radio.subtitle)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .opacity(0.8)
                    }
                
                if isLoading {
                    ProgressView()
                        .padding(.leading)
                }
                    Spacer()
                    if radio.isFavorite {
                        HeartView(isFilled: true)
                            .padding()
                    }
            }
            .background(self.tapped ? Color.accentColor: Color("TabBarColor"))
            .gesture(tap)
            .cornerRadius(5)
        }
        
    }
    
    func playStation() {
        radioPlayer.initPlayer(url: radio.urlString)
        radioPlayer.play()
    }
    
    func startFakeNetworkRequest() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }

}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(radio: radios[1])
            .previewLayout(.sizeThatFits)
    }
}

