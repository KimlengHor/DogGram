//
//  DogGramApp.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/4/23.
//

import SwiftUI
import FirebaseCore

@main
struct DogGramApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
