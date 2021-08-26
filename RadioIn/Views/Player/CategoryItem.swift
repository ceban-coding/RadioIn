//
//  CategoryItem.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/22/21.
//

import SwiftUI

struct CategoryItem: View {
    var radio : Stations
    @EnvironmentObject var network : RadioAPI

    var body: some View {
        VStack(alignment: .leading){
            URLImage(urlString: radio.favicon, data: nil)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 85, maxHeight: 85)
                .cornerRadius(8)
            Text(radio.name)
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(radio: RadioAPI().stations[2])
            .environmentObject(RadioAPI())
            .previewLayout(.sizeThatFits)
    }
}
