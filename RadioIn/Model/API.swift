//
//  API.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/21/21.
//

import Foundation

class apiCall {
    func getAudio(completion:@escaping ([RadioIn]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let comments = try! JSONDecoder().decode([RadioIn].self, from: data!)
            print(comments)
            
            DispatchQueue.main.async {
                completion(comments)
            }
        }
        .resume()
    }
}
