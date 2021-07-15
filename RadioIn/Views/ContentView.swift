//
//  ContentView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            FavoritesView()
                .tag(0)
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                    Text("Favorites")
                }
            SearchView()
                .tag(1)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            PlayerView(radio: radios[1])
                .tag(2)
                .tabItem {
                    Image(systemName: "play.circle")
                    Text("Player")
                }
            info()
                .tag(3)
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


