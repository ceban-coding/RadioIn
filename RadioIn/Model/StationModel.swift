//
//  StationModel.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/17/21.
//

import Foundation

struct Stations: Hashable, Codable{
    let stationuuid: String
    let favicon: String
    let name: String
    let country: String
    let url: String
}
