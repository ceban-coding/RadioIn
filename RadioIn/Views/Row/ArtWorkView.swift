//
//  ArtWorkView.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/30/21.
//

import SwiftUI

struct ArtWorkView: View {
    let image: Image?
    
    var body: some View {
          ZStack {
            if image != nil {
                image!
                .resizable()
            } else {
              Image("emptyr")
                .resizable()
            }
          }
        }
      }
    
