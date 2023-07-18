//
//  PostView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/4/23.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
    var showHeaderAndFooter: Bool
    
    var body: some View {
        VStack {
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    NavigationLink {
                        ProfileView(profileDisplayName: post.username, profileUserID: post.userID, isMyProfile: false)
                    } label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                        .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(6)
            }
            
            // MARK: IMAGE
            ZStack {
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            if showHeaderAndFooter {
                // MARK: FOOTER
                HStack(spacing: 20) {
                    Button {
                        if post.likedByUser == true {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    } label: {
                        Image(systemName: (post.likedByUser ?? false) ? "heart.fill" : "heart")
                    }
                    .tint((post.likedByUser ?? false) ? .red : .primary)

                    //MARK: COMMENT ICON
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                            .foregroundColor(.primary)
                    }
                    
                    Image(systemName: "paperplane")
                    Spacer()
                }
                .font(.title3)
                .padding(6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        Spacer(minLength: 0)
                    }
                    .padding(6)
                }
            }
        }
    }
    
    //MARK: FUNCTIONS
    func likePost() {
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
    }
    
    func unlikePost() {
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0)
    
    static var previews: some View {
        PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
