//
//  PostImageView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/15/23.
//

import SwiftUI

struct PostImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State var captionText: String = ""
    @Binding var imageSelected: UIImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                }
                .tint(.primary)
                
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                    .clipped()
                
                
                TextField("Add your caption...", text: $captionText)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light
                                ? Color.MyTheme.beigeColor
                                : Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .font(.headline)
                    .padding(.horizontal)
                    .textInputAutocapitalization(.sentences)
                
                Button {
                    postPicture()
                } label: {
                    Text("Post Picture".uppercased())
                        .font(.title)
                        .bold()
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .light
                                    ? Color.MyTheme.purpleColor
                                    : Color.MyTheme.yellowColor)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .tint(colorScheme == .light
                      ? Color.MyTheme.yellowColor
                      : Color.MyTheme.purpleColor)
            }
        }
    }
    
    //MARK: FUNCTIONS
    func postPicture() {
        print("Post picture to database here")
    }
}

struct PostImageView_Previews: PreviewProvider {
    
    @State static var image = UIImage(named: "dog1")!
    
    static var previews: some View {
        PostImageView(imageSelected: $image)
            .preferredColorScheme(.dark)
    }
}
