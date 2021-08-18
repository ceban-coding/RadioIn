//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var radioApi : RadioAPI
    @State private var text = ""
    @State var showPlayer = false
    
    var body: some View {
        VStack {
            SearchBar(text: $text)
                .padding(.init(top: 20, leading: 25, bottom: 10, trailing: 25))
            SearchingListView()
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

struct SearchingListView: View {
    @EnvironmentObject var radioAPi: RadioAPI
    
    var body: some View {
        ScrollView {
            VStack(spacing: 7) {
                ForEach(radioAPi.stations, id: \.self) { station in
                    ZStack {
                        StationRow(radio: station)
                    }
                }
            }
            .padding(.init( top: 0, leading: 10, bottom: 8, trailing: 10))
        }
        .padding(.bottom, 43)
    }
}
