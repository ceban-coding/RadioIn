//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    
    var radios: [Radio] = RadioList.topTen
    
    var body: some View {
        
        VStack {
            SearchBar(text: .constant(""))
            List(radios, id: \.id) { radio in
                StationRow(radio: radio)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
