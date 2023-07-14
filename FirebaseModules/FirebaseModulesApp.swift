//
//  FirebaseModulesApp.swift
//  FirebaseModules
//
//  Created by Dang Quoc Huy on 12/07/2023.
//

import SwiftUI
import GoogleSignIn

@main
struct FirebaseModulesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                    }
                }
        }
    }
}
