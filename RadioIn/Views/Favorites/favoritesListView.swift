//
//  favoritesListView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/30/21.
//

import SwiftUI
import SwiftUIListSeparator

struct favoritesListView: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        NavigationView {
                List {
                        ForEach(radios) { stations in
                            StationRow(radio: stations, isPlaying: $isPlaying)
                                .padding(.init(top: 8, leading: 10, bottom: 0, trailing: 10))
                        }
                        .onDelete(perform: delete)
                     .listRowInsets(EdgeInsets())
                }
                .listSeparatorStyle(.none)
                .padding(.bottom, 50)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Favorites")
        }
    }
    
    func delete(at offsets: IndexSet) {
            radios.remove(atOffsets: offsets)
        }
}

struct favoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        favoritesListView(isPlaying: .constant(false))
    }
}
