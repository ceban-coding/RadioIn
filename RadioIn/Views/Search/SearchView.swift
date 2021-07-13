//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack {
                VStack {
                    SearchBar(text: .constant(""))
                }
                .padding(.top, 8)
               
                ForEach(radios, id: \.self) { station in
                    StationRow(radio: station)
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
        .padding(.bottom, 50)
        
        
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
