//
//  radioApi.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/10/21.
//

import SwiftUI
import Combine

class RadioAPI: ObservableObject {
    @Published var stations: [Stations] = []
    
    func fetchData() {
        guard let url = URL(string: "https://de1.api.radio-browser.info/json/stations/bycountry/moldova") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                    do {
                        let stations = try JSONDecoder().decode([Stations].self, from: data)
                        DispatchQueue.main.async {
                            self?.stations = stations
                        }
                    } catch let error {
                        print("Error decoding: ", error)
                    
                }
            }
            
        }
        dataTask.resume()
    }
}
