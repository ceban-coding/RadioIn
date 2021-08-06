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
    @State var state: SwimplyPlayIndicator.AudioState = .stop
    @State var isLoading = false
    @State var isSelected: Bool = false
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        
        ZStack {
            HStack {
                ArtWorkView(image: radio.image)
                    .frame(width: 65, height: 65)
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.8)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 20) {
                        Text(radio.title)
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        
                        if isLoading {
                            ProgressView()
                        } else {
                            SwimplyPlayIndicator(state: self.$state, color: .white)
                                .frame(width: 18, height: 18)
                                .opacity(0.7)
                        }
                    }
                    
                    Text(radio.subtitle)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
                Spacer()
                
                if radio.isFavorite {
                    HeartView(isFilled: true)
                        .padding()
                }
            }
            .background(self.isSelected ? Color.accentColor: Color("TabBarColor"))
            
            .cornerRadius(5)
        }
        .onTapGesture {
            onTapping()
        }
    }
    
    
    func onTapping() {
        isSelected.toggle()
        if isSelected {
            isPlaying = true
            startFakeNetworkRequest()
            self.state = .play
            playStation()
        } else {
            self.state = .stop
            isPlaying = false
            isLoading = false
            radioPlayer.pause()
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
        StationRow(radio: radios[1], isPlaying: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}

