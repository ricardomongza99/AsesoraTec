//
//  TutorView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import SwiftUI

// MARK: - BODY

struct TutorView: View {
    var tutor: Tutor
    @State private var copiedOpacity = 0.0
    
    var body: some View {
        List {
            Section("📚 COURSES") {
                ForEach(tutor.courses, id: \.self) {
                    Text($0)
                }
            }
            
            Section("💵 Price per hour") {
                Text(tutor.priceString)
            }
            
            Section("🕐 Availabilty") {
                Text(tutor.availability)
            }
            
            Section {
                Button(tutor.phone) {
                    UIPasteboard.general.string = tutor.phone
                    copiedOpacity = 1.0
                    withAnimation(.linear(duration: 2.0)) {
                        copiedOpacity = 0.0
                    }
                }
                .buttonStyle(.borderless)
            } header: {
                Text("📱 MOBILE")
            } footer: {
                Text("Copied!")
                    .opacity(copiedOpacity)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("\(tutor.emoji ?? "") \(tutor.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

// MARK: - PREVIEW

struct TutorView_Previews: PreviewProvider {
    static let tutors = TutorAPI.getTutors()

    static var previews: some View {
        NavigationView {
            TutorView(tutor: tutors[0])
        }
    }
}
