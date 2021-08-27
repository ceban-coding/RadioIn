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
    case topList
}

struct ContentView: View {
    @State private var showDetails: Bool = false
    @State private var selection: Tab = .favorites
    @EnvironmentObject var network : RadioAPI
    @EnvironmentObject var player: PlayerViewModel
   
    
    var body: some View {
            TabView(selection: $selection) {
                favoritesListView()
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favorites")
                    }
                    .tag(Tab.favorites)
                SearchView()
                    .tag(Tab.search)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                PlayerView()
                    .tag(Tab.player)
                    .tabItem {
                        Image(systemName: "play.circle")
                        Text("Player")
                            
                    }
                topVotedList()
                    .tag(Tab.topList)
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("Top Voted")
                    }
            }
            .overlay(
                VStack {
                    Spacer()
                    PlayerBar()
                        .frame(height: 140)
                }
            )
            .ignoresSafeArea(.keyboard)
            .onAppear {
                network.fetchData()
            }
    }
}

struct TabBarView_Previews: PreviewProvider {
   
    static var previews: some View {
        ContentView()
            .environmentObject(RadioAPI())
            .environmentObject(PlayerViewModel())
    }
}
