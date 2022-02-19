//
//  UnderCircleView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 19.02.2022.
//

import SwiftUI

struct UnderCircleView: View {
    @Binding var show: Bool
    @Binding var seconds: String
    var body: some View {
        Circle()
            .frame(width: 140, height: 140)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.2),
                    radius: 10,
                    x: 10, y: 10)
            .blur(radius: 2)
            .offset(x: 0, y: show ? 130 : 0)
            .overlay(
                TextField("Seconds", text: $seconds)
                    .frame(width: 100, height: 50)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .offset(x: 0, y: show ? 130 : 0)
            )
            .animation(.easeInOut(duration: 0.5), value: show)
    }
}

struct UnderCircleView_Previews: PreviewProvider {
    static var previews: some View {
        UnderCircleView(show: .constant(true), seconds: .constant("3"))
    }
}
