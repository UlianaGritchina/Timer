//
//  TextFildView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 19.02.2022.
//

import SwiftUI

struct TextFildView: View {
    @Binding var name: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 290, height: 60)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.5),
                        radius: 15,
                        x: 10, y: 10)
                .blur(radius: 2)
            HStack {
                TextField("Your name", text: $name)
                    .frame(width: 240, height: 60)
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 25, height: 45)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.4),
                            radius: 10,
                            x: 0, y: 5)
                    .blur(radius: 1)
                    .overlay(Text("\(name.count)")
                                .bold()
                                .foregroundColor(name.count > 2 ? .green : .red))
            }
        }
        .padding()
    }
}

struct TextFildView_Previews: PreviewProvider {
    static var previews: some View {
        TextFildView(name: .constant(""))
    }
}
