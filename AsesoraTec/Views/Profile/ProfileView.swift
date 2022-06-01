//
//  ProfileView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 01/06/22.
//

import SwiftUI

// MARK: - BODY

struct ProfileView: View {
    @State private var name = ""
    @State private var courses = [String]()
    @State private var price = 0.0
    @State private var availability = ""
    @State private var phone = ""
    
    private var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    /// Checks if all fields have been filled
    private var addButtonDisabled: Bool {
        let fields = [name, availability, phone]
        for field in fields {
            if field.isEmpty {
                return true
            }
        }
        return courses.isEmpty
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Name", text: $name)
                } header: {
                    Text("🤓 Profile")
                }
                
                Section {
                    ForEach(0..<courses.count, id: \.self) { index in
                        TextField("Course", text: $courses[index])
                    }
                    .onDelete(perform: delete)
                    
                    Button {
                        courses.append("")
                    } label: {
                        HStack(spacing: 16) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                            Text("add course")
                                .font(.callout)
                        }
                    }
                    .buttonStyle(.plain)

                } header: {
                    Text("📚 Courses")
                }
                
                Section {
                    TextField("Price per hour", value: $price, formatter: formatter)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("💵 Price per hour")
                } footer: {
                    Text("This is the price per 1 hour session.")
                }
                
                Section {
                    TextEditor(text: $availability)
                } header: {
                    Text("🕐 Availabilty")
                }
                
                Section {
                    TextField("Phone number", text: $phone)
                        .keyboardType(.numberPad)
                } header: {
                    Text("📱 MOBILE")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Profile")
            .animation(.default, value: courses)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        print("Save data")
                    }
                    .disabled(addButtonDisabled)
                }
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
    // MARK: - FUNCTIONS
    
    private func delete(at offsets: IndexSet) {
        courses.remove(atOffsets: offsets)
    }
}

// MARK: - PREVIEWS

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
