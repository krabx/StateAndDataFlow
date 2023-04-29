//
//  GradientView.swift
//  StateAndDataFlow
//
//  Created by Богдан Радченко on 29.04.2023.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        AngularGradient(colors: [Color(red: 124/255, green: 238/255, blue: 206/255), Color(red: 215/255, green: 247/255, blue: 212/255), Color(red: 168/255, green: 213/255, blue: 255/255)], center: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
