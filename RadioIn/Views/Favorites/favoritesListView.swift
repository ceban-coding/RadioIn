//
//  favoritesListView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/30/21.
//

import SwiftUI
import SwiftUIListSeparator

struct favoritesListView: View {
    @EnvironmentObject var network : RadioAPI
    @State var favorites = []
    
    var body: some View {
        NavigationView {
            if favorites.isEmpty {
                EmptyFavoritesView()
            } else {
                List {
                    ForEach(network.stations, id: \.self ) { stations in
                        StationRow(radio: stations)
                            .padding(.init(top: 0, leading: 10, bottom: 7, trailing: 10))
                    }
                    .onDelete(perform: self.deleteItem)
                    .listRowInsets(EdgeInsets())
                }
                .listSeparatorStyle(.none)
                .padding(.bottom, 43)
                .padding(.top, 10)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Favorites")
            }
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.network.stations.remove(atOffsets: indexSet)
    }
}

struct favoritesListView_Previews: PreviewProvider {
    
    static var previews: some View {
        favoritesListView()
            .environmentObject(RadioAPI())
    }
}
