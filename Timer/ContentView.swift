//
//  ContentView.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import SwiftUI

struct ContentView: View {
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
        ContentView()
            .environmentObject(UserManager())
    }
}

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

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
