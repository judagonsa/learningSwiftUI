//
//  ProfileModel.swift
//  learningSwiftUI
//
//  Created by Julian González on 18/06/24.
//

import Foundation

struct ProfileModel {
    var name: String
    var lastName: String
    var email: String
    var typeDocument: TypeDocument
    var numberDocument: String
    var bithDate: Date
    var numberPhone: String
    var gender: TypeGender
    
    init(name: String, lastName: String, email: String, typeDocument: TypeDocument, numberDocument: String, bithDate: Date, numberPhone: String, gender: TypeGender) {
        self.name = name
        self.lastName = lastName
        self.email = email
        self.typeDocument = typeDocument
        self.numberDocument = numberDocument
        self.bithDate = bithDate
        self.numberPhone = numberPhone
        self.gender = gender
    }
}
