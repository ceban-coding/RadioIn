//
//  CategoryRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/22/21.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var network: RadioAPI
    var radio: Stations
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .fontWeight(.regular)
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(network.stations, id: \.self) { station in
                     CategoryItem(radio: station)
                    }
                }
                .padding(.trailing, 10)
            }
        }
        .frame(maxHeight: 155)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var radios = RadioAPI().stations
    
    static var previews: some View {
        CategoryRow(radio: radios[1])
            .previewLayout(.sizeThatFits)
            
    }
}
