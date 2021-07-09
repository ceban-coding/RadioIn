//
//  ContentView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var editMode = EditMode.inactive
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("TabBarColor"))
    }
    
    var body: some View {
        
        
        TabView {
            NavigationView {
                Text("Favorites")
                    .navigationBarTitle("Favorites")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Edit") {
                                print("Help tapped")
                            }
                        }
                    }
            }
            
            .tabItem {
                Image(systemName: "suit.heart")
                Text("Favorites")
            }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            Text("Player Tab")
                .tabItem {
                    Image(systemName: "play.circle")
                    Text("Player")
                }
            info()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
