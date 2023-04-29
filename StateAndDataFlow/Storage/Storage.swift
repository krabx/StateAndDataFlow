//
//  User.swift
//  StateAndDataFlow
//
//  Created by Богдан Радченко on 29.04.2023.
//

import Foundation
import SwiftUI

final class Storage: ObservableObject {
    static let shared = Storage()
    private init() {}
    
    @AppStorage("login") var userName = ""
    
    func save(_ user: User) {
        userName = user.name
    }
}
