//
//  EmptyFavoritesView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/27/21.
//

import SwiftUI

struct EmptyFavoritesView: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 50){
            Spacer()
            VStack(spacing: 15) {
                Image(systemName: "heart")
                    .font(.system(size: 60))
                    .foregroundColor(.green)
                    .opacity(0.8)
                Text("Favorites")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Search for radio stations and add ones you like to your favorites list.")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
            }
            
//            Button(action: {
//          self.showDetails.toggle()
//            }) {
//                Text("Search Radio Stations")
//                    .font(.body)
//                    .padding(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.green, lineWidth: 2)
//                            .opacity(0.6)
//                    )
//            }
            Spacer()
        }
    }
}

struct EmptyFavoritesView_Previews: PreviewProvider {
    @State static var tab = Tab.search
    
    static var previews: some View {
        EmptyFavoritesView()
    }
}
