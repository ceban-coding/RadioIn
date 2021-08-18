//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/17/21.
//

import SwiftUI

struct SwiftUIView: View {
    @StateObject var radioApi = RadioAPI()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(radioApi.stations, id: \.self) { station in
                    HStack {
                        Image("emptyr")
                            .frame(width: 130, height: 70)
                        
                        Text(station.name)
                            .bold()
                    }
                    
                }
            }
            .onAppear {
                radioApi.fetchData()
            }
        }
        .navigationTitle("Stations")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
