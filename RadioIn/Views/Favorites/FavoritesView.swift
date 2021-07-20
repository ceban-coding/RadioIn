//
//  FavoritesView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct FavoritesView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(radios) { station in
                            ZStack {
                                    NavigationLink(
                                    destination: PlayerView(radio: station)) {
                                        StationRow(radio: station)
                                }
                            }
                        }
                    }
                    .padding(.top, 9)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
                PlayerBar()
                    
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {

    static var previews: some View {
        FavoritesView()
    }
}
