//
//  ContentView.swift
//  FirebaseModules
//
//  Created by Dang Quoc Huy on 12/07/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FacebookLogin

struct ContentView: View {
    var body: some View {
        VStack {
            GoogleSignInButton(action: handleSignInButton)
                .padding()
        }
        
    }
    
    func handleSignInButton() {
        guard let rootViewController = (UIApplication.shared.connectedScenes.first
                                        as? UIWindowScene)?.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController) { signInResult, error in
                guard error == nil else {
                    // Handle error
                    return
                }
                guard let result = signInResult else {
                    // Inspect error
                    return
                }
                // TODO: If sign in succeeded, display the app's main content View.
                guard let idToken = result.user.idToken?.tokenString else {
                    // ...
                    return
                }
                let accessToken = result.user.accessToken.tokenString
                let credential = GoogleAuthProvider.credential(
                    withIDToken: idToken,
                    accessToken: accessToken
                )
                Auth.auth().signIn(with: credential) { result, error in
                    // At this point, our user is signed in
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
