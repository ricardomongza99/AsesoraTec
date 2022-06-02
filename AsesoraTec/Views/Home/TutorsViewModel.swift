//
//  TutorsViewModel.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import Foundation
import Firebase

extension TutorsView {
    class ViewModel: ObservableObject {
        
        @Published var tutors = [Tutor]()
        @Published var searchText = ""
        
        var filteredTutors: [Tutor] {
            if searchText.isEmpty {
                return tutors
            } else {
                var filteredTutors = [Tutor]()
                for tutor in tutors {
                    if tutor.major.lowercased().contains(searchText.lowercased()) {
                        filteredTutors.append(tutor)
                        continue
                    }
                    for course in tutor.courses {
                        if course.lowercased().contains(searchText.lowercased()) {
                            filteredTutors.append(tutor)
                            break
                        }
                    }
                }
                return filteredTutors
            }
        }
        
        let db = Firestore.firestore()
        
        /// Get tutors data
        func getData() {
            tutors = []
            db.collection("tutors").getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting tutor documents: \(error.localizedDescription)")
                }
                
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        
                        // iterate over all tutor documents
                        for document in snapshot.documents {
                            do {
                                let tutor = try document.data(as: Tutor.self)
                                self.tutors.append(tutor)
                            } catch {
                                print("Could not decode tutor document")
                            }
                        }
                    }
                }
            }
        }
    }
}
