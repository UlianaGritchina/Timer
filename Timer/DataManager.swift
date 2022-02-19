//
//  DataManager.swift
//  Timer
//
//  Created by Ульяна Гритчина on 19.02.2022.
//

import Foundation

class DataManager {
    static var shered = DataManager()
    
    private init() {}
    
    func createUser(name: String) {
        UserDefaults.standard.set(name, forKey: "username")
        UserDefaults.standard.set(true, forKey: "isRegistered")
    }
    
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "isRegistered")
    }
}
