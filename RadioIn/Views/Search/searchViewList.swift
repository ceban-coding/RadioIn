//
//  searchViewList.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/27/21.
//

import SwiftUI
import SwiftUIListSeparator

struct searchViewList: View {
    
    @State var text = ""
    var body: some View {
       
      
        VStack {
            SearchBar(text: $text)
                .padding(.init(top: 30, leading: 15, bottom: 10, trailing: 15))
            
            
            List {
                ForEach(radios) { stations in
                    StationRow(radio: stations)
                        .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                .listSeparatorStyle(.none)
                .listRowInsets(EdgeInsets())
            }
            
            PlayerBar()
        }
    }
}


struct searchViewList_Previews: PreviewProvider {
    static var previews: some View {
        searchViewList()
    }
}

