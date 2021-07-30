//
//  TabBarView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentSelection = 1
    @State var expand = false

    
    var body: some View {
     
            
            TabView(selection: $currentSelection) {
                FavoritesView()
                    .tag(1)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favorites")
                    }
                SearchView()
                    .tag(0)
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
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
