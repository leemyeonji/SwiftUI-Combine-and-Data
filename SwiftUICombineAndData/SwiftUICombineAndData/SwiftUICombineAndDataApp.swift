//
//  SwiftUICombineAndDataApp.swift
//  SwiftUICombineAndData
//
//  Created by 임현지 on 2021/06/05.
//

import SwiftUI
import Firebase

@main
struct SwiftUICombineAndDataApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
