//
//  RadioInApp.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/7/21.
//

import SwiftUI

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//    let session = AVAudioSession.sharedInstance()
//    do {
//      try session.setCategory(.playback, options: .defaultToSpeaker)
//      try session.setActive(true)
//    } catch {
//      print("AVAudioSession configuration error: \(error.localizedDescription)")
//    }
//
//    return true
//  }
//}

@main
struct RadioInApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        let network = RadioAPI()
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
