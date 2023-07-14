//
//  UploadView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/14/23.
//

import SwiftUI

struct UploadView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button {
                    
                } label: {
                    Text("Take photo".uppercased())
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.MyTheme.yelloColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.purpleColor)
                
                Button {
                    
                } label: {
                    Text("Import photo".uppercased())
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.MyTheme.purpleColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.yelloColor)
            }
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
