//
//  StationRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct StationRow: View {
    let radio: RadioIn
    
    var body: some View {
        
        HStack {
            HStack {
                radio.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(5)
                    
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(radio.title)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color("TextColorRow"))
                    
                    Text(radio.subtitle)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color("TextColorRow"))
                }
                Spacer()
                if radio.isFavorite {
                    HeartView(isFilled: true)
                        .padding()
                }
            }
            Spacer()
        }
       .background(Color("TabBarColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(radio: radios[1])
            .previewLayout(.sizeThatFits)
    }
}

