//
//  CategoryItem.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/22/21.
//

import SwiftUI

struct CategoryItem: View {
    var radios: RadioStation
    
    var body: some View {
        VStack(alignment: .leading){
            radios.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 85, maxHeight: 85)
                .cornerRadius(8)
            Text(radios.title)
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(radios: radios[1])
            .previewLayout(.sizeThatFits)
    }
}
