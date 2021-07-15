//
//  custom.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/14/21.
//

import SwiftUI

struct custom: View {
    @State var array = ["First Text", "Second Text", "Third Text"]
    @State var indices : [Int] = []
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Favorites")
                    .font(.system(size: 40))
                    .bold()
                    .frame(width: geo.size.width * 0.95, alignment: .leading)
                    .padding(.top, 50)
                ScrollView {
                    LazyVStack(spacing: 1) {
                        ForEach (0..<array.count, id: \.self) { index in
                            if !indices.contains(index) {
                                row(text: array[index], index: index, indices : $indices)
                                    .frame(height: 60)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct custom_Previews: PreviewProvider {
    static var previews: some View {
        custom()
    }
}
