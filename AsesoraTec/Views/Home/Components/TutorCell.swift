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
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .bottom,spacing: 8) {
                Text(tutor.major)
                    .font(.title)
                    .bold()

                
                Spacer()
                
                Image("tec")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            Text(tutor.name)
                .foregroundColor(.secondary)


            VStack(alignment: .leading) {
                ForEach(tutor.courses, id: \.self) { course in
                    Text("• \(course)")
                }
            }
            
            HStack(spacing: 0) {
                Spacer()
                Text(tutor.priceString)
                    .bold()
                if tutor.price > 0 {
                    Text(" / hr")
                        .foregroundColor(.secondary)
                }
            }
                
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
        TutorCell(tutor: tutors[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
