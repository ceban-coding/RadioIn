//
//  EmptySearchView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/27/21.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 40))
                    .foregroundColor(.green)
                    .opacity(0.8)
                Text("Search")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding()
            
            Text(" Search by station name,\n country or genre.")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct EmptySearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchView()
    }
}
