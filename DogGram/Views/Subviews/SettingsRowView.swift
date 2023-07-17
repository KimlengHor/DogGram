//
//  SettingsRowView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/16/23.
//

import SwiftUI

struct SettingsRowView: View {
    
    var leftIcon: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: leftIcon)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36)
            
            Text(text)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
        }
        .padding(.vertical, 4)
        .foregroundColor(.primary)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(leftIcon: "heart.fill", text: "Row title", color: Color.blue)
    }
}
