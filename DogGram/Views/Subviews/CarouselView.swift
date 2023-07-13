//
//  CarouselView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/13/23.
//

import SwiftUI

struct CarouselView: View {
    
    @State var timerAdded: Bool = false
    @State var selection: Int = 1
    let maxCount: Int = 8
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(1..<maxCount, id: \.self) { index in
                Image("dog\(index)")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 300)
        .onAppear {
            if timerAdded == false {
                addTimer()
            }
        }
    }
    
    //MARK: FUNCTIONS
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            withAnimation(.default) {
                if selection == maxCount - 1 {
                    selection = 1
                } else {
                    selection = selection + 1
                }
            }
        }
        
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
