//
//  FavoriteButton.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/9/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
                    isSet.toggle()
                }) {
                    Image(systemName: isSet ? "heart.fill" : "heart")
                        .foregroundColor(isSet ? Color.red : Color.white)
                        .font(.system(size: 25))
            
                }
            }

    }


struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
