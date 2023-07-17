//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/17/23.
//

import SwiftUI

struct SettingsEditImageView: View {
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage //Image shown on this screen
    @State var showImagePicker: Bool = false
    @State var sourceType = UIImagePickerController.SourceType.photoLibrary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(description)
                Spacer()
            }
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(12)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Import".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            }
            .tint(Color.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            }
            
            Button {
                
            } label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            }
            .tint(Color.MyTheme.yellowColor)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle("Edit Display Name")
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditImageView(title: "Test Title", description: "This is a description", selectedImage: UIImage(named: "dog1")!)
        }
    }
}
