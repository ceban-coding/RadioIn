//
//  StationRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//
import SwiftUI
import URLImage

struct StationRow: View {
    var radio: Stations
    @StateObject var Player = PlayerViewModel()
    @State var state: SwimplyPlayIndicator.AudioState = .stop
    @State private var isLoading = false
   
    var body: some View {
        ZStack {
            HStack {
                URLImage(urlString: radio.favicon, data: nil)
                    .frame(width: 63, height: 63)
                    .aspectRatio(contentMode: .fill)
                    
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 10) {
                        Text(radio.name)
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        
                        if isLoading {
                            ProgressView()
                                .frame(width: 15.0, height: 15.0)
                        } else {
                            SwimplyPlayIndicator(state: self.$state, color: .white)
                                .frame(width: 15, height: 15)
                                .opacity(0.7)
                        }
                    }
                    
                    Text(radio.country)
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .opacity(0.6)
                }
                .padding(.leading, 5)
                Spacer()
        
            }
            .background(Player.isPlaying ? Color.accentColor : Color("TabBarColor"))
            .cornerRadius(5)
        }
     
        .onTapGesture {
            onTapping()
        }
    }
    
    func onTapping() {
        if !Player.isPlaying {
            startFakeNetworkRequest()
            self.state = .play
            Player.initPlayer(url: radio.url)
        } else {
            self.state = .stop
            isLoading = false
            Player.pause()
        }
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
        StationRow(radio: RadioAPI().stations[2])
            .previewLayout(.sizeThatFits)
    }
}

