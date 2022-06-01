//
//  View+Extensions.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 01/06/22.
//


import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
