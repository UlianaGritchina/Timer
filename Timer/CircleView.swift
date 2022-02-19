//
//  CircleView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 19.02.2022.
//

import SwiftUI

struct CircleView: View {
    @Binding var show: Bool
    @Binding var counter: Int
    @Binding var seconds: String
    var body: some View {
        Circle()
            .frame(width: 150, height: 150)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.5),
                    radius: 15,
                    x: 10, y: 10)
            .blur(radius: 2)
            .overlay(
                Text(String(counter))
                    .bold()
                    .foregroundColor(.blue.opacity(0.5))
                    .font(.system(size: 50))
                    .shadow(radius: 1)
            )
            .onTapGesture {
                show.toggle()
                if !show {
                    counter = Int(seconds) ?? 3
                    UIApplication.shared.endEditing()
                }
            }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(show: .constant(true), counter: .constant(3), seconds: .constant("3"))
    }
}
