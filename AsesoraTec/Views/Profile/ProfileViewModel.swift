//
//  ProfileViewModel.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 01/06/22.
//

import Foundation
import Firebase

extension ProfileView {
    class ViewModel: ObservableObject {
        
        @Published var name = ""
        @Published var major = ""
        @Published var courses = [String]()
        @Published var price = 0.0
        @Published var availability = ""
        @Published var phone = ""
        
        let db = Firestore.firestore()
        
        /// Used to check for changes
        private var savedTutor: Tutor?

        /// Checks if all fields have been filled
        var saveButtonIsDisabled: Bool {
            // If there are no changes
            if let tutor = savedTutor {
                if (tutor.name == name &&
                    tutor.major == major &&
                    tutor.courses == courses &&
                    tutor.price == price &&
                    tutor.availability == availability &&
                    tutor.phone == phone) {
                    return true
                }
            }
            
            let fields = [name, availability, phone]
            for field in fields {
                if field.isEmpty {
                    return true
                }
            }
            return courses.isEmpty
        }
        
        // MARK: - ACTION MEHTODS
        
        func saveButtonPressed() {
            let tutor = Tutor(name: name,
                              phone: phone,
                              courses: courses,
                              major: major,
                              availability: availability,
                              price: price)
            updateTutor(tutor: tutor)
        }
        
        
        // MARK: - FIREBASE METHODS
        
        func getTutor() {
            // TODO: Changed hard coded id to get document of current signed in tutor
            let docRef = db.collection("tutors").document("4z57OCFiPGl74QXWAVZL")
            
            docRef.getDocument { document, error in
                if let error = error {
                    print("Error getting tutor document: \(error.localizedDescription)")
                }
                
                if let document = document {
                    DispatchQueue.main.async {
                        do {
                            let tutor = try document.data(as: Tutor.self)
                            self.savedTutor = tutor
                            
                            // Update fields
                            self.name = tutor.name
                            self.major = tutor.major
                            self.courses = tutor.courses
                            self.price = tutor.price
                            self.availability = tutor.availability
                            self.phone = tutor.phone
                        } catch {
                            print("Could not decode tutor document: \(error)")
                        }
                    }
                }
            }
        }
        
        private func updateTutor(tutor: Tutor) {
            let docRef = db.collection("tutors").document("4z57OCFiPGl74QXWAVZL")
            
            do {
                try docRef.setData(from: tutor)
                self.getTutor()n

            } catch {
                print("Could not encode tutor: \(error)")
            }
        }
    }
}
