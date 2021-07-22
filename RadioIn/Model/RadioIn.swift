//
//  RadioIn.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/12/21.
//

import Foundation
import SwiftUI

struct RadioIn: Hashable, Codable, Identifiable{
    var id: Int
    var title: String
    var subtitle: String
    var isFavorite: Bool
    var urlString: String
    
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    

}
