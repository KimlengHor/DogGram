//
//  ContentView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var currentUserID: String? = nil
    
    var body: some View {
        TabView {
            NavigationView {
                FeedView(posts: PostArrayObject(), title: "Feed")
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Feed")
            }
            
            NavigationView {
                BrowseView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Browse")
            }
            
            UploadView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            ZStack {
                if currentUserID != nil {
                    NavigationView {
                        ProfileView(profileDisplayName: "My Profile", profileUserID: "", isMyProfile: true)
                    }
                } else {
                    SignUpView()
                }
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
        .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
