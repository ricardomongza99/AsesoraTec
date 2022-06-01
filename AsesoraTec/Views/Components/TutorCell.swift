//
//  TutorCell.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import SwiftUI

// MARK: - BODY

struct TutorCell: View {
    var tutor: Tutor
    
    var body: some View {
        HStack(spacing: 16) {
            Text(tutor.emoji ?? "📚")
                .font(.title)
            VStack(alignment: .leading, spacing: 8) {
                Text(tutor.name)
                    .bold()
                Text(tutor.coursesString)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
            Spacer()
            Text(tutor.priceString)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(white: 0, opacity: 0.1), radius: 4)
    }
}

// MARK: - PREVIEWS

struct TutorCell_Previews: PreviewProvider {
    static let tutors = TutorAPI.getTutors()
    
    static var previews: some View {
        TutorCell(tutor: tutors[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
