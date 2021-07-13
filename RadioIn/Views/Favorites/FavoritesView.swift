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
        
        ScrollView {
            LazyVStack {
                ForEach(radios, id: \.self) { station in
                    StationRow(radio: station)
                }
                .onMove { (source, destination) in
                    self.radios.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete { offsets in
                    self.radios.remove(atOffsets: offsets)
                }
            }
            .padding(.trailing, 10)
            .padding(.leading, 10)
        }
        .padding(.bottom, 50)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
