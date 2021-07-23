//
//  CategoryRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/22/21.
//

import SwiftUI

struct CategoryRow: View {
    var radio: RadioIn
    let radioPlayer = musicPlayer()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .foregroundColor(.secondary)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(radios) { station in
                     CategoryItem(radios: station)
                    }
                }
            }
        }
        .frame(height: 170)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(radio: radios[1])
            .previewLayout(.sizeThatFits)
    }
}
