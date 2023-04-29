//
//  User.swift
//  StateAndDataFlow
//
//  Created by Богдан Радченко on 29.04.2023.
//

import Foundation
import SwiftUI

final class StorageManager: ObservableObject {
    static let shared = StorageManager()
    private init() {}
    
    @AppStorage("user") var userInfo: Data?
    
    func save(_ user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userInfo = data
    }
    
    func fetch() -> User {
        guard let data = userInfo else { return User(name: "") }
        guard let user = try? JSONDecoder().decode(User.self, from: data) else {
            return User(name: "")
        }
        return user
    }
}
