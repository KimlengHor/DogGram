//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/17/23.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Text(description)
                Spacer()
            }
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(colorScheme == .light
                            ? Color.MyTheme.beigeColor
                            : Color.MyTheme.purpleColor)
                .cornerRadius(12)
                .font(.headline)
                .textInputAutocapitalization(.sentences)
            
            Button {
                
            } label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light
                                ? Color.MyTheme.purpleColor
                                : Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            }
            .tint(colorScheme == .light
                  ? Color.MyTheme.yellowColor
                  : Color.MyTheme.purpleColor)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle("Edit Display Name")
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "Test Title", description: "This is a description", placeholder: "Test Placeholder")
        }
        .preferredColorScheme(.dark)
    }
}
