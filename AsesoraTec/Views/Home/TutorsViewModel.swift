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
        
        /// Get tutors data
        func getData() {
            
            let db = Firestore.firestore()
            
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
