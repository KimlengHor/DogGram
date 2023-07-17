//
//  SettingsView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/16/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: SECTION 1: DOG GRAM
                GroupBox {
                    HStack(spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                        
                        Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you!")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right")
                }
                .padding()
                
                //MARK: SECTION 2: PROFILE
                GroupBox {
                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current display name", title: "Display Name", description: "You can edit your display name here. This will be seen by other users on your profile and on your posts!", placeholder: "Your display name here...")
                    } label: {
                        SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpleColor)
                    }
                    
                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current bio here", title: "Bio", description: "Your bio is a great place to let other users know a little about you", placeholder: "You bio here...")
                    } label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                    }
                    
                    NavigationLink {
                        SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves of their dog!", selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
                    }

                    SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.purpleColor)
                } label: {
                    SettingsLabelView(labelText: "DogGram", labelImage: "person.fill")
                }
                .padding()
                
                //MARK: SECTION 3: APPLICATION
                GroupBox {
                    Button {
                        openCustomURL(urlString: "https://www.google.com")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                    }

                    Button {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowColor)
                    }

                    Button {
                        openCustomURL(urlString: "https://www.bing.com")
                    } label: {
                        SettingsRowView(leftIcon: "globe", text: "DogGram's Website", color: Color.MyTheme.yellowColor)
                    }
                } label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                }
                .padding()
                
                //MARK: SECTION 4: SIGN OFF
                GroupBox {
                    Text("DogGram was made with love. \n All Rights Reserved \n Cool App Inc. \n Copyright 2023 ❤️")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom, 80)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                    })
                    .tint(.primary)
            )
        }
    }
    
    //MARK: FUNCTIONS
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
