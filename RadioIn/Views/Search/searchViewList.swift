//
//  searchViewList.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/27/21.
//

import SwiftUI
import SwiftUIListSeparator

struct searchViewList: View {
  
    var body: some View {
                List {
                        ForEach(radios) { stations in
                        StationRow(radio: stations)
                            .padding(4)
                        }
                        .listSeparatorStyle(.none)
                        .listRowInsets(EdgeInsets())
                    }
                    .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
            }
        }


struct searchViewList_Previews: PreviewProvider {
    static var previews: some View {
        searchViewList()
    }
}

