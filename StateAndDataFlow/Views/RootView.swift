//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var storage = Storage.shared
    
    var body: some View {
        Group {
            if !storage.userName.isEmpty {
                ContentView()
            } else {
                LoginView()
            }
        }.environmentObject(storage)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
