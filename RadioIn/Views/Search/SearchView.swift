//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    @Binding var isPlaying: Bool
  
    var body: some View {
            VStack {
                SearchBar(text: $text)
                    .padding(.init(top: 20, leading: 25, bottom: 7, trailing: 25))
                SearchingListView(isPlaying: $isPlaying)
            }
            .ignoresSafeArea(.keyboard)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isPlaying: .constant(false))
    }
}

struct SearchingListView: View {
    @Binding var isPlaying: Bool
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(radios) { station in
                    ZStack {
                        StationRow(radio: station, isPlaying: $isPlaying)
                    }
                }
            }
            .padding(.init( top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        .padding(.bottom, 50)
    }
}
