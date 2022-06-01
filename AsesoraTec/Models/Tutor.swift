//
//  Tutor.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Tutor: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var phone: String
    var courses: [String]
    var major: String
    var availability: String
    var price: Double
    
    var coursesString: String {
        return courses.joined(separator: " • ")
    }
    
    var priceString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return price > 0 ? formatter.string(from: NSNumber(value: price))! : "FREE"
    }
    
}

class TutorAPI {
    static func getTutors() -> [Tutor] {
        return [
            Tutor(name: "Miguel Sánchez", phone: "8111223342", courses: ["Mate 1", "Mate 2", "Mate 3", "Ecuaciones diferenciales"], major: "IQA", availability: "Lunes a jueves de 4 a 6", price: 0.0),
            Tutor(name: "Luis Mario Benitez", phone: "5183421244", courses: ["Electricidad y magnetismo", "Mate 2", "Mate 3", "Física 1", "Física 2"], major: "IME", availability: "Jueves de 4 a 8", price: 100.0),
            Tutor(name: "Patricio Valerio", phone: "833218678", courses: ["Análisis y expresión verbal", "Inglés 1"], major: "LED", availability: "Sábados a las 10am", price: 300.0),
            Tutor(name: "Juan Luis Guerrero", phone: "8112758091", courses: ["Mate 1"], major: "INT", availability: "Lu/Mi 8pm a 10pm", price: 200.0),
        ]
    }
}
