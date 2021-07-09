//
//  Radio.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct Radio: Identifiable{
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let url: URL
}

struct RadioList {
    
    static let topTen = [
        Radio(imageName: "1",
              title: "Retro FM",
              subtitle: "88.3 FM - Moscow, Russia",
              url: URL(string: "https://retrofm.ru/online/player.php")!),
        
        Radio(imageName: "2",
              title: "Diaspora FM",
              subtitle: "FM 82.8 - Chisinau, Moldova,",
              url: URL(string: "http://streema.com/radios/play/Diaspora_FM_2")!),
        
        Radio(imageName: "3",
              title: "Kiss FM",
              subtitle: "FM 100.9 - Cisinau, Moldova",
              url: URL(string: "http://streema.com/radios/play/Kiss_FM_3")!),
        
        Radio(imageName: "4",
              title: "Radio ZUM",
              subtitle: "93.3 FM - Chisinau, Moldova",
              url: URL(string: "http://onlineradiobox.com/md/radiozum/player/?cs=md.radiozum&played=1")!),
        
        Radio(imageName: "5",
              title: "Pro FM",
              subtitle: "FM 106.9 - Chisinau, Moldova",
              url: URL(string: "http://streema.com/radios/play/Pro_FM_2")!),
        
        
        Radio(imageName: "6",
              title: "Ruskoe Radio",
              subtitle: "FM 105.7 - Moscow, Russia",
              url: URL(string: "http://streema.com/radios/play/Russkoe_Radio_2")!),
        
        Radio(imageName: "7",
              title: "101 Ruskii Rap",
              subtitle: "101.RU - Moscow, Russia",
              url: URL(string: "http://streema.com/radios/play/101.RU_Russian_Rap")!),
        
        Radio(imageName: "8",
              title: "Ruskaya Volna",
              subtitle: "AMG Radio - Moscow, Russia",
              url: URL(string: "http://streema.com/radios/play/Rus_Hit")!),
        
        Radio(imageName: "9",
              title: "Radio Energy",
              subtitle: "Russian Radio - Latvia",
              url: URL(string: "https://retrofm.ru/online/player.php")!),
        
        Radio(imageName: "10",
              title: "HIT FM",
              subtitle: "FM 101.7",
              url: URL(string: "http://streema.com/radios/play/XHT")!),
    ]
}
