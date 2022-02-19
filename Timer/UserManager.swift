//
//  UserManager.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import Combine
import Foundation

final class UserManager: ObservableObject {
    @Published var isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
    @Published var name = UserDefaults.standard.string(forKey: "username")
}
