//
//  RegisterView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserManager
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextFildView(name: $name)
                WhiteButton(title: "Sign up",
                            action: {regisreUser()},
                            isActive: name.count > 2 ? true : false)
                Spacer()
            }
            .navigationTitle("Registration")
        }
    }
    
    private func regisreUser() {
        if !name.isEmpty {
            DataManager.shered.createUser(name: name)
            user.isRegistered = true
            user.name = name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

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
