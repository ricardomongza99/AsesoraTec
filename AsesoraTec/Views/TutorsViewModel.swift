//
//  TutorsViewModel.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import Foundation

extension TutorsView {
    class ViewModel: ObservableObject {
        @Published var tutors = TutorAPI.getTutors()
    }
}
