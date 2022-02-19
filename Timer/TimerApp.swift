//
//  TimerApp.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import SwiftUI

@main
struct TimerApp: App {
    @StateObject private var userManager = UserManager()
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
