//
//  radioStation.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/5/21.
//

import Foundation

class radioStation: Identifiable, Codable {
   var id = UUID()
    var name: String
    var country: String
    var url: String
}
