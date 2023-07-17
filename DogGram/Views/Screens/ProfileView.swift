//
//  ProfileView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/16/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var profileDisplayName: String
    
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
            
                                }, label: {
                                    Image(systemName: "line.horizontal.3")
                                })
                                    .tint(Color.MyTheme.purpleColor)
                                    .opacity(isMyProfile ? 1.0 : 0.0)
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe", profileUserID: "", isMyProfile: true)
        }
    }
}