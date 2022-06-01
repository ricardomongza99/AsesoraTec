//
//  TutorsView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import SwiftUI

// MARK: - BODY

struct TutorsView: View {
    @ObservedObject var viewModel = ViewModel()
    
    let columns = [
        GridItem()
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.tutors) { tutor in
                        NavigationLink {
                            TutorDetailView(tutor: tutor)
                        } label: {
                            TutorCell(tutor: tutor)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()

            }
            .navigationTitle("AsesoraTec")
        }
    }
    
    init() {
        viewModel.getData()
    }
}

// MARK: - PREVIEWS

struct TutorsView_Previews: PreviewProvider {
    static var previews: some View {
        TutorsView()
    }
}