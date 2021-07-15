//
//  StationRow.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct StationRow: View {
    var radio: RadioIn
    @State private var radioSelected = false
    
    var body: some View {
        
        HStack {
            HStack {
                radio.image
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: 60, height: 60)
                    .scaledToFill()
                    .padding(4)
       
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
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
        .cornerRadius(5)
    }

}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        StationRow(radio: radios[1])
            .previewLayout(.device)
    }
}

