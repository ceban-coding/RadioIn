//
//  HeartView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/12/21.
//

import SwiftUI

struct HeartView: View {
    let isFilled: Bool
    
    var body: some View {
        Image(systemName: isFilled ? "heart.fill" : "heart")
            .foregroundColor(isFilled ? .red : .white)
            .opacity(0.8)
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeartView(isFilled: true)
            HeartView(isFilled: false)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
