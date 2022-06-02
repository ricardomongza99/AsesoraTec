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
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.filteredTutors) { tutor in
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
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.getData()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
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
