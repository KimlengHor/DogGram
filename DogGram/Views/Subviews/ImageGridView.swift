//
//  ImageGridView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/14/23.
//

import SwiftUI

struct ImageGridView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            alignment: .center) {
                ForEach(posts.dataArray, id:\.self) { post in
                    NavigationLink {
                        FeedView(posts: PostArrayObject(post: post), title: "Post")
                    } label: {
                        PostView(post: post, addHeartAnimationToView: false, showHeaderAndFooter: false)
                    }
                }
            }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(posts: PostArrayObject())
            .previewLayout(.sizeThatFits)
    }
}
