//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
            List {
                ForEach(radios, id: \.id) { station in
                    StationRow(radio: station)
                        .listRowInsets(EdgeInsets())
                        .padding(8)
                }
            }
        }
    }
}





struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
