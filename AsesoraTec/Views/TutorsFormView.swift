//
//  TutorsFormView.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import SwiftUI

// MARK: - BODY

struct TutorsFormView: View {
    
    @EnvironmentObject var viewModel: TutorsView.ViewModel
    
    @State private var name = ""
    @State private var emoji = ""
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
        let fields = [name, emoji, availability, phone]
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
                    TextField("Emoji", text: $emoji)
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
            .navigationTitle("Tutor")
            .navigationBarTitleDisplayMode(.inline)
            .animation(.default, value: courses)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let emoji = emoji.isEmpty ? nil : "\(emoji.first!)"
                        let tutor = Tutor(name: name, emoji: emoji, phone: phone, courses: courses, availability: availability, price: price)
                        viewModel.tutors.append(tutor)
                        dismiss()
                    }
                    .disabled(addButtonDisabled)
                }
            }
        }
    }
    
    // MARK: - FUNCTIONS
    
    private func delete(at offsets: IndexSet) {
        courses.remove(atOffsets: offsets)
    }
}

// MARK: - PREVIEW

struct TutorsFormView_Previews: PreviewProvider {
    static var previews: some View {
        TutorsFormView()
            .environmentObject(TutorsView.ViewModel())
    }
}
