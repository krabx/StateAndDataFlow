//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var storage: StorageManager
    @State private var name = ""
    
    var body: some View {
        ZStack {
            GradientView()
            
            VStack {
                HStack {
                    TextField("Enter your name", text: $name)
                        .multilineTextAlignment(.center)
                        .font(.title)
                    
                    Text(name.count.formatted())
                        .foregroundColor(name.count < 3 ? .red : .green)
                        .font(.title)
                }
                
                Button(action: login) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("Ok")
                            .font(.title2)
                    }
                }.disabled(name.count < 3 ? true : false)
            }
            .padding()
        }
    }
    
    private func login() {
        if !name.isEmpty {
            let user = User(name: name)
            storage.save(user)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
