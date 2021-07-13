//
//  FavoritesView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct FavoritesView: View {
    @State private var radios: [RadioIn] = load("radio.json")
    
    var body: some View {
        
        List {
            ForEach(radios, id: \.id) { station in
                StationRow(radio: station)
                    .listRowInsets(EdgeInsets())
                    .padding(8)
            }
            .onMove { (source, destination) in
                self.radios.move(fromOffsets: source, toOffset: destination)
            }
            .onDelete { offsets in
                self.radios.remove(atOffsets: offsets)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
