//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {

    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    SearchBar(text: .constant(""))
                        .padding(.top, 8)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                }
                ScrollView {
                    LazyVStack {
                        ForEach(radios) { station in
                            ZStack {
                                    NavigationLink(
                                    destination: PlayerView(radio: station)) {
                                        StationRow(radio: station)
                                }
                            }
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
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
