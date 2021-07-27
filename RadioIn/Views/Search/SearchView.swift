//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

struct SearchView: View {
   
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
                EmptySearchView()
                PlayerBar()
            }
            
//            VStack {
//                VStack {
//                    SearchBar(text: $searchText)
//                        .padding(.init(top: 12, leading: 10, bottom: 5, trailing: 10))
//                }
//                ScrollView {
//                    LazyVStack {
//                        ForEach(radios) { station in
//                            ZStack {
//                                    StationRow(radio: station)
//                            }
//                        }
//                    }
//                    .padding(.init( top: 0, leading: 10, bottom: 10, trailing: 10))
//                }
//                PlayerBar()
//            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Search")
        }
    }
}

struct SearchBar: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator()
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
