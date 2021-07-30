//
//  favoritesListView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/30/21.
//

import SwiftUI
import SwiftUIListSeparator

struct favoritesListView: View {
    var body: some View {
        
        VStack {
            VStack{
                Text("Favorites")
                    .font(.title3)
            }
                .frame(height: 50)
            
            List {
                ForEach(radios) { stations in
                    StationRow(radio: stations)
                        .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                .listRowInsets(EdgeInsets())
                
            }
            PlayerBar()
        }
    }
}

struct favoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        favoritesListView()
    }
}
