//
//  SignInWithGoogle.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/21/23.
//

import Foundation
import SwiftUI
import GoogleSignIn
import FirebaseAuth

class SignInWithGoogle: NSObject {
    static let instance = SignInWithGoogle()
    
    var onboardingView: OnboardingView!
    
    func startSignInWithGoogleFlow(view: OnboardingView) {
        self.onboardingView = view
        
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
        
            guard error == nil else {
                self.onboardingView.showError.toggle()
                return
            }

            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                return
            }
            
            let fullName: String = user.profile?.name ?? ""
            let email: String = user.profile?.email ?? ""
            

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: user.accessToken.tokenString)
            
            self.onboardingView.connectToFirebase(name: name, email: email, provider: "google", credential: credential)
        }
    }
}
