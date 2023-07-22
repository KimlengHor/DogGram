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
import SwiftUI
import FirebaseFirestore

let DB_BASE = Firestore.firestore()

class AuthService {
    
    //MARK: PROPERTIES
    static let instance = AuthService()
    
    private var REF_USERS = DB_BASE.collection("users")
    
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
    
    func createNewUserInDatabase(name: String, email: String, providerID: String, provider: String, profileImage: UIImage, hander: @escaping(_ userID: String?) -> ()) {
        
        let document = REF_USERS.document()
        let userID = document.documentID
        
        let userData : [String: Any] = [
            DatabaseUserField.displayName: name,
            DatabaseUserField.email: email,
            DatabaseUserField.providerID: providerID,
            DatabaseUserField.provider: provider,
            DatabaseUserField.userID: userID,
            DatabaseUserField.bio: "",
            DatabaseUserField.dateCreated: FieldValue.serverTimestamp(),
        ]
        
        document.setData(userData) { error in
            if let error = error {
                print("Uploading data failed", error.localizedDescription)
                hander(nil)
                return
            }
            
            hander(userID)
        }
    }
}
