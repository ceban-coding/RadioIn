//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $text)
                    .padding(.init(top: 12, leading: 10, bottom: 5, trailing: 10))
                
                SearchingListView()
                PlayerBar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Search")
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}



struct SearchingListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(radios) { station in
                    ZStack {
                        StationRow(radio: station)
                            .onTapGesture {
                                
                            }
                    }
                }
            }
            .padding(.init( top: 0, leading: 10, bottom: 10, trailing: 10))
        }
    }
}
