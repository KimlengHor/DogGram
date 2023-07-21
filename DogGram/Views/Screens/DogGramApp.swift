//
//  DogGramApp.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/4/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct DogGramApp: App {
    
    init() {
        FirebaseApp.configure()
        
        //Google
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
