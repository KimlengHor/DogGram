//
//  CommentsView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/9/23.
//

import SwiftUI

struct CommentsView: View {
    
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here...", text: $submissionText)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .tint(Color.MyTheme.purpleColor)
            }
            .padding(.all, 10)
        }
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getComments()
        }
    }
    
    //MARK: FUNCTIONS
    
    func getComments() {
        let comment1 = CommentModel(commentID: "", userID: "", username: "JoeGreen", content: "This is first comment", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Alex", content: "This is second comment", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Stefanie", content: "This is third comment", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "Grace", content: "This is fourth comment", dateCreated: Date())
        self.commentArray.append(contentsOf: [comment1, comment2, comment3, comment4])
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
