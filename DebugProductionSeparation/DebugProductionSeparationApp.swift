//
//  DebugProductionSeparationApp.swift
//  DebugProductionSeparation
//
//  Created by Kentaro Mihara on 2023/10/05.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
#if DEBUG
      let resource = "GoogleService-Info-dev"
#else
      let resource = "GoogleService-Info"
#endif
      
      if let filePath = Bundle.main.path(forResource: resource, ofType: "plist") {
          guard let options = FirebaseOptions(contentsOfFile: filePath) else {
              assert(false, "Could not load config file.")
              return false
          }
          FirebaseApp.configure(options: options)
      } else {
          FirebaseApp.configure()
      }
      return true
  }
}

@main
struct DebugProductionSeparationApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
