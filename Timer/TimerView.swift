//
//  ContentView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    @State private var show = false
    @State private var seconds = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                ZStack {
                    
                    UnderCircleView(show: $show,
                                    seconds: $seconds)
                    CircleView(show: $show,
                               counter: $timer.counter,
                               seconds: $seconds)
                }
                
                Spacer()
                Spacer()
                
                WhiteButton(title: timer.buttonTitle,
                            action: {timer.startTimer()},
                            isActive: timer.buttonState != .wait)
                    .padding()
                
                WhiteButton(title: "Log Out",
                            action: {logOut()},
                            isActive: true)
            }
            .padding()
            .navigationTitle(user.name ?? "")
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    private func logOut() {
        DataManager.shered.deleteUser()
        user.isRegistered = false
        user.name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager())
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
