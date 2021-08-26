//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var radioApi : RadioAPI
    @State private var searchTerm = ""
    @State var showPlayer = false
    @State var searchView = []
    
    
    var body: some View {
        VStack {
            SearchBar(text: $searchTerm)
                .padding(.init(top: 20, leading: 25, bottom: 10, trailing: 25))
            if searchTerm.isEmpty {
                EmptySearchView()
            } else {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(radioApi.stations.filter {
                            self.searchTerm.isEmpty ? true :
                                "\($0)".contains(self.searchTerm)
                        }, id: \.self) { stations in
                            StationRow(radio: stations)
                                
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .padding(.init( top: 0, leading: 10, bottom: 8, trailing: 10))
                }
                .padding(.bottom, 43)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView()
            .environmentObject(RadioAPI())
    }
}

