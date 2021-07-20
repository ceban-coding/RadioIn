//
//  animation.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/15/21.
//

import SwiftUI

struct animationView: View {
    @State private var animate = false
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 10){
            HStack {
                ForEach(0..<11) { _ in
                VStack {
                    ForEach(0..<6) { _ in
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("playerBar"))
                            .animation(.default)
                            .cornerRadius(5)
                    }
                }
                }
            }
        }
        
    }
}


struct ShowSize: View {
    var body: some View {
        GeometryReader { proxy in
            Text("x = \(Int(proxy.frame(in: .global).minX))")
                .foregroundColor(.white)
        }
    }
}

struct animation_Previews: PreviewProvider {
    static var previews: some View {
        animationView()
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 300, alignment: .center)
    }
}
