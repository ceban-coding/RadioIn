//
//  SwiftUIView.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/17/21.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
        } else {
            Image(systemName: "radio.fill")
                .resizable()
                .padding(10)
                .opacity(0.8)
                .onAppear {
                 fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            self.data = data
        }
        task.resume()
    }
}
