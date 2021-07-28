//
//  StationRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct StationRow: View {
     var radio: RadioStation
    
    var body: some View {
        
        HStack {
          ZStack {
                radio.image
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFill()
            }
            HStack {
               
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
        }
        .background(Color("TabBarColor"))
        .cornerRadius(5)
    }

}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(radio: radios[1])
            .previewLayout(.sizeThatFits)
    }
}

