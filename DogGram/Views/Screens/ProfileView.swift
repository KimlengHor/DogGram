//
//  ProfileView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/16/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var profileDisplayName: String
    @State var showSettings: Bool = false
    
    var profileUserID: String
    var posts = PostArrayObject()
    var isMyProfile: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProfileHeaderView(displayDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    showSettings.toggle()
                                }, label: {
                                    Image(systemName: "line.horizontal.3")
                                })
                                    .tint(colorScheme == .light
                                          ? Color.MyTheme.purpleColor
                                          : Color.MyTheme.yellowColor)
                                    .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .preferredColorScheme(colorScheme)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe", profileUserID: "", isMyProfile: true)
        }
        .preferredColorScheme(.dark)
    }
}
