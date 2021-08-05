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
    @State var expand = false
    
    var body: some View {
            TabView(selection: $selection) {
                FavoritesView()
                    .tag(Tab.favorites)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favorites")
                    }
                SearchView()
                    .tag(Tab.search)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                PlayerView(radio: radios[1])
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
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
