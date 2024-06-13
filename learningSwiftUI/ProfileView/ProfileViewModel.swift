//
//  ProfileViewModel.swift
//  learningSwiftUI
//
//  Created by Julian González on 12/06/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published  var name = ""
    @Published  var isValidName = true
    
    @Published  var lastName = ""
    @Published  var isValidLastName = true
    
    @Published  var email = ""
    @Published  var isValidNEmail = true
    
    @Published  var typeDocument = ""
    @Published  var typeDocumentEnum: TypeDocument?
    @Published  var isValidTypeDocument = true
    
    @Published  var numberDocument = ""
    @Published  var isValidNumberDocument = true
    
    @Published  var birthDate: Date?
    @Published  var isValidBirthDate = true
    
    @Published  var numberPhone = ""
    @Published  var isValidNumberPhone = true
    
    @Published  var typeGender = ""
    @Published  var typeGenderEnum: TypeGender?
    @Published  var isValidGender = true
    
    func validationField() -> Bool {
        
        
        return true
    }
}
