//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var storage: StorageManager
    
    var body: some View {
        ZStack {
            GradientView()
            
            VStack {
                Text("Hi, \(storage.fetch().name)")
                    .font(.largeTitle)
                    .padding(.top, 100)
                
                Text(timer.counter.formatted())
                    .font(.largeTitle)
                    .padding(.top, 100)
                
                Spacer()
                
                ButtonTimerView(timer: timer)
                
                Spacer()
                
                ButtonView(action: logOut, title: "LogOut", color: .blue)
            }
            .padding()
        }
    }
    
    private func logOut() {
        let user = User(name: "")
        storage.save(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(StorageManager.shared)
    }
}

struct ButtonTimerView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        ButtonView(action: timer.startTimer, title: timer.buttonTitle, color: .red)
    }
}
