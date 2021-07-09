//
//  StationRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct StationRow: View {
    var radio: Radio
    
    var body: some View {
        HStack {
            HStack {
                Image(radio.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(radio.title)
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(Color("TextColorRow"))
                    
                    Text(radio.subtitle)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color("TextColorRow"))
                }
                .padding()
            }
            
            Spacer()
        }
        .background(Color("TabBarColor"))
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(radio: RadioList.topTen.first!)
    }
}
