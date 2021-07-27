//
//  searchViewList.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/27/21.
//

import SwiftUI

struct searchViewList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
             
            List {
                ForEach(radios) {
                    
                    stations in
                StationRow(radio: stations)
                }
            }
            
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct searchViewList_Previews: PreviewProvider {
    static var previews: some View {
        searchViewList()
    }
}
