//
//  AudioStatus.swift
//  RadioIn
//
//  Created by Ion Ceban on 8/10/21.
//

import Foundation

enum AudioStatus: Int, CustomStringConvertible {

  case stopped,
       playing

  var audioName: String {
    let audioNames = ["Audio:Stopped", "Audio:Playing"]
    return audioNames[rawValue]
  }

  var description: String {
    return audioName
  }

}
