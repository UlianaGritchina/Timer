//
//  WhiteButton.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import SwiftUI

struct WhiteButton: View {
    let title: String
    let action: () -> Void
    let isActive: Bool
    var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .foregroundColor(title == "Log Out" ? .red.opacity(0.7) : .blue.opacity(0.7))
                .frame(width: 200, height: 60)
                .background(Capsule()
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.5),
                                        radius: 15,
                                        x: 10, y: 10)
                                .blur(radius: 2))
        }.disabled(!isActive)
    }
    
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButton(title: "Start", action: {}, isActive: true)
    }
}
