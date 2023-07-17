//
//  ProfileHeaderView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/16/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @Binding var displayDisplayName: String
    
    
    var body: some View {
        VStack(spacing: 10) {
            
            //MARK: PROFILE PICTURE
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(60)
            
            //MARK: USER NAME
            Text(displayDisplayName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            //MARK: BIO
            Text("This is the area where the user can add a bio to their profile!")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .center, spacing: 20) {
                //MARK: POSTS
                VStack(spacing: 5) {
                    Text("5")
                        .bold()
                        .font(.title2)
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2)
                    
                    Text("Posts")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                
                //MARK: LIKES
                VStack(spacing: 5) {
                    Text("20")
                        .bold()
                        .font(.title2)
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2)
                    
                    Text("Likes")
                        .font(.callout)
                        .fontWeight(.medium)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    
    @State static var name: String = "Joe"
    
    static var previews: some View {
        ProfileHeaderView(displayDisplayName: $name)
            .previewLayout(.sizeThatFits)
    }
}
