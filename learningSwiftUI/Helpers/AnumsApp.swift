//
//  AnumsApp.swift
//  learningSwiftUI
//
//  Created by Julian González on 10/06/24.
//

import Foundation

enum TypeDocument: CaseIterable, Identifiable {
    var id: Self { self }
    
    case dni, document, passport
    
    var name: String {
        switch self {
        case .dni:  return "DNI"
        case .document:  return "Cédula"
        case .passport:  return "Pasaporte"
        }
    }
}

enum TypeGender: CaseIterable, Identifiable {
    var id: Self { self }
    
    case female, male, other
    
    var name: String {
        switch self {
        case .female:  return "Mujer"
        case .male:  return "Hombre"
        case .other:  return "Otro"
        }
    }
}
