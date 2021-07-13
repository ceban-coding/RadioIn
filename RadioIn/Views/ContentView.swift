//
//  ContentView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var editMode = EditMode.inactive
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("TabBarColor"))
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            NavigationView {
                FavoritesView()
                    .padding(.top, 7)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: EditButton())
                    .navigationBarTitle("Favorites")
            }
            .tag(1)
            .tabItem {
                Image(systemName: "suit.heart.fill")
                Text("Favorites")
            }
            
            NavigationView {
                SearchView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("Search")
            }
                .tag(0)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            NavigationView {
                PlayerView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("Player")
            }
                .tag(2)
                .tabItem {
                    Image(systemName: "play.circle")
                    Text("Player")
                }
            
            NavigationView {
                info()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("iON Developer")
            }
                .tag(3)
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
        }
        .overlay(
            VStack {
                Spacer()
                PlayerBar()
                    .frame(height: 210)
            }
            .edgesIgnoringSafeArea(.all)
        )
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


