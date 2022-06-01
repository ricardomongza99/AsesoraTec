//
//  ContentView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 01/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TutorsView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
