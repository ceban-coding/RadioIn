//
//  tabgesture.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/30/21.
//

import SwiftUI

struct tabgesture: View {
    @State var tapped = false

    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in self.tapped = !self.tapped }
    }

    var body: some View {
        Circle()
            .fill(self.tapped ? Color.blue : Color.red)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(tap)
    }
}
struct tabgesture_Previews: PreviewProvider {
    static var previews: some View {
        tabgesture()
    }
}
