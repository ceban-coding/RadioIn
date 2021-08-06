//
//  FavoritesView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct FavoritesView: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ListView()
                //EmptyFavoritesView()
                //PlayerBar()
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

struct ListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(radios) { station in
                    ZStack {
                        StationRow(radio: station)
                    }
                }
            }
            .padding(.init( top: 10, leading: 10, bottom: 50, trailing: 10))
        }
        
    }
}
