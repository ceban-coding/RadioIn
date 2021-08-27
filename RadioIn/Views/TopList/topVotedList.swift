//
//  searchList.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/26/21.
//

import SwiftUI

struct topVotedList: View {
    @ObservedObject var radioApi = RadioAPI()
    @State var searchView = []
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(radioApi.stations, id: \.self ) { stations in
                            StationRow(radio: stations)
                        }
                    }
                    .padding(.init( top: 0, leading: 10, bottom: 8, trailing: 10))
                }
                .padding(.bottom, 43)
                .padding(.top, 10)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Top Stations")
            }
            .padding(.bottom, 3)
            .onAppear {
                radioApi.fetchTopVotedRadios()
            }
        }
    }
}

struct searchList_Previews: PreviewProvider {
    static var previews: some View {
        topVotedList()
            .environmentObject(RadioAPI())
    }
}
