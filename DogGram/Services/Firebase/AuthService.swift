//
//  AuthService.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/21/23.
//


// Used to Authenticate users in Firebase
// Used to handle user accounts in Firebase

import Foundation
import FirebaseAuth

class AuthService {
    
    //MARK: PROPERTIES
    static let instance = AuthService()
    
    //MARK: AUTH USER FUNCTIONS
    func logInUserToFirebase(credential: AuthCredential, handler: @escaping (_ providerID: String?, _ isError: Bool) -> ()) {
        Auth.auth().signIn(with: credential) {(result, error) in
            if error != nil {
                print("Login error in firebase")
                handler(nil, true)
                return
            }
            
            guard let providerID = result?.user.uid else {
                print("Provider ID error in firebase")
                handler(nil, true)
                return
            }
            
            handler(providerID, false)
        }
    }
}
