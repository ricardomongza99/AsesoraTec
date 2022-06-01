//
//  ContentView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 01/06/22.
//

import SwiftUI

// MARK: - BODY

struct ContentView: View {
    var body: some View {
        TabView {
            TutorsView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
