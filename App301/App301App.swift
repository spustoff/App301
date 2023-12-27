//
//  App301App.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: "app_WZ9Nh2fFq5XVyYM7DFZFzsgyT5PebR")
        
        OneSignal.initialize("f5065ba2-b3d5-4194-b71a-79fdef759334", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("875dbed4423dcdbb04a3529a069752a9")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

@main
struct App301App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
