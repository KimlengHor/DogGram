//
//  PostView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/4/23.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var postImage = UIImage(named: "dog1")!
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    @State var showActionSheet: Bool = false
    @State var confirmDialogType = PostConfirmDialogOption.general
    
    var showHeaderAndFooter: Bool
    
    enum PostConfirmDialogOption {
        case general
        case reporting
        
    }
    
    var body: some View {
        VStack {
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    NavigationLink {
                        ProfileView(profileDisplayName: post.username, profileUserID: post.userID, isMyProfile: false)
                    } label: {
                        Image(uiImage: postImage)
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
                    
                    Button {
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                            .foregroundColor(Color.primary)
                    }
                    .confirmationDialog("What would you like to do?", isPresented: $showActionSheet, titleVisibility: .visible) {
                        
                        getDialogButtons()
                    }
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
                    
                    Button {
                        sharePost()
                    } label: {
                        Image(systemName: "paperplane")
                    }
                    .tint(Color.primary)

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
    
    func getDialogButtons() -> some View {
        VStack {
            switch self.confirmDialogType {
            
            case .general:
                VStack {
                    Button(role: .destructive) {
                        self.confirmDialogType = .reporting
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.showActionSheet.toggle()
                        }
                    } label: {
                        Text("Report")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Learn more...")
                    }
                    
                    Button(role: .cancel) {
                        
                    } label: {
                        Text("Cancel")
                    }
                }
                
            case .reporting:
                VStack {
                    Button(role: .destructive) {
                        
                    } label: {
                        Text("This is inappropiate")
                    }
                    
                    Button(role: .destructive) {
                        
                    } label: {
                        Text("This is spam")
                    }
                    
                    Button(role: .destructive) {
                        
                    } label: {
                        Text("It made me uncomfortable")
                    }
                    
                    Button(role: .cancel) {
                        self.confirmDialogType = .general
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    func reportPost(reason: String) {
        print("REPORT POST NOW")
    }
    
    func sharePost() {
        
        let message = "Check out this post on DogGram"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true)
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0)
    
    static var previews: some View {
        PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
