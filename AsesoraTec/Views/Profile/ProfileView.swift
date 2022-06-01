//
//  ProfileView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 01/06/22.
//

import SwiftUI

// MARK: - BODY

struct ProfileView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    private var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
        
    var body: some View {
        NavigationView {
            List {
                Section("🤓 Profile") {
                    TextField("Name", text: $viewModel.name)
                    TextField("Major", text: $viewModel.major)
                }
                
                Section("📚 Courses") {
                    ForEach(0..<viewModel.courses.count, id: \.self) { index in
                        TextField("Course", text: $viewModel.courses[index])
                    }
                    .onDelete(perform: delete)
                    
                    addCourseButton
                }
                
                Section("💵 Price per hour") {
                    TextField("Price per hour", value: $viewModel.price, formatter: formatter)
                        .keyboardType(.decimalPad)
                }
                
                Section("🕐 Availabilty") {
                    TextEditor(text: $viewModel.availability)
                }
                
                Section("📱 MOBILE") {
                    TextField("Phone number", text: $viewModel.phone)
                        .keyboardType(.numberPad)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Profile")
            .animation(.default, value: viewModel.courses)
            .toolbar(content: {
                Button("Save") {
                    viewModel.saveButtonPressed()
                }
                .disabled(viewModel.saveButtonIsDisabled)
            })
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        viewModel.courses.remove(atOffsets: offsets)
    }
    
    init() {
        viewModel.getTutor()
    }

}

// MARK: - PREVIEWS

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// MARK: - COMPONENTS

extension ProfileView {
    
    private var addCourseButton: some View {
        Button {
            viewModel.courses.append("")
        } label: {
            HStack(spacing: 16) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                Text("add course")
                    .font(.callout)
            }
        }
        .buttonStyle(.plain)
    }
}
