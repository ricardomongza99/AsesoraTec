//
//  TutorsView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import SwiftUI

// MARK: - BODY

struct TutorsView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showTutorsForm = false
    
    let columns = [
        GridItem()
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.tutors) { tutor in
                        NavigationLink {
                            TutorView(tutor: tutor)
                        } label: {
                            TutorCell(tutor: tutor)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()

            }
            .navigationTitle("AsesoraTec")
            .toolbar {
                Button {
                    showTutorsForm = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showTutorsForm) {
                TutorsFormView()
                    .environmentObject(viewModel)
            }
        }
    }
}

// MARK: - PREVIEWS

struct TutorsView_Previews: PreviewProvider {
    static var previews: some View {
        TutorsView()
    }
}
