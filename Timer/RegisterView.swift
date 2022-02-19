//
//  RegisterView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var user: UserManager
    @State private var name = ""
    
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
