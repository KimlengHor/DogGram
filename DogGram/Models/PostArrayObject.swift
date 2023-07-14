//
//  PostArrayObject.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/4/23.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        let post1 = PostModel(postID: "", userID: "", username: "Kimleng", caption: "This is a caption", dateCreated: Date(), likeCount: 0)
        let post2 = PostModel(postID: "", userID: "", username: "Raza", caption: "This is a caption This is a caption This is a caption This is a caption This is a caption This is a caption This is a caption This is a caption", dateCreated: Date(), likeCount: 0)
        let post3 = PostModel(postID: "", userID: "", username: "Kimlong", caption: "This is a caption", dateCreated: Date(), likeCount: 0)
        let post4 = PostModel(postID: "", userID: "", username: "Kimnay", caption: nil, dateCreated: Date(), likeCount: 0)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    /// USED FOR SINGLE POST SELECTION
    init(post: PostModel) {
        self.dataArray.append(post)
    }
}
