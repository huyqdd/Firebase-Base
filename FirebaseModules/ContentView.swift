//
//  ContentView.swift
//  FirebaseModules
//
//  Created by Dang Quoc Huy on 12/07/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct ContentView: View {
    var body: some View {
        GoogleSignInButton(action: handleSignInButton)
            .padding()
    }
    
    func handleSignInButton() {
        guard let rootViewController = (UIApplication.shared.connectedScenes.first
                                        as? UIWindowScene)?.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController) { signInResult, error in
                guard let result = signInResult else {
                    // Inspect error
                    return
                }
                // If sign in succeeded, display the app's main content View.
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
