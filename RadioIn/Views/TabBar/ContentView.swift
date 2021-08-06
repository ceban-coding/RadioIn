//
//  TabBarView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/16/21.
//

import SwiftUI

enum Tab {
    case favorites
    case search
    case player
    case info
}

struct ContentView: View {
    @State private var selection: Tab = .favorites
    @State private var isPlaying: Bool = false
    
    var body: some View {
            TabView(selection: $selection) {
                favoritesListView(isPlaying: $isPlaying)
                    .tag(Tab.favorites)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favorites")
                    }
                SearchView(isPlaying: $isPlaying)
                    .tag(Tab.search)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                PlayerView(radio: radios[1], isPlaying: $isPlaying)
                    .tag(Tab.player)
                    .tabItem {
                        Image(systemName: "play.circle")
                        Text("Player")
                    }
                info()
                    .tag(Tab.info)
                    .tabItem {
                        Image(systemName: "info.circle")
                        Text("Info")
                    }
            }
            .overlay(
                VStack {
                    Spacer()
                    PlayerBar(isPlaying: $isPlaying)
                        .frame(height: 140)
                }
            )
            .ignoresSafeArea(.keyboard)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
