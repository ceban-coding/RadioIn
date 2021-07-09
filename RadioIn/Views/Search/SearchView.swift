//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var radios: [Radio] = RadioList.topTen
    
    var body: some View {
        
        VStack {
            SearchBar(text: .constant(""))
            List {
                ForEach(radios, id: \.id) { item in
                    StationRow(radio: item)
                }
                .onDelete(perform: delete)
               
            }
        }
    }
    
    //Delete method for deleting rows from List
     func  delete(at offsets: IndexSet) {
        radios.remove(atOffsets: offsets)
    }
    
  
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
