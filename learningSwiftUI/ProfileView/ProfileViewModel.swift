//
//  ProfileViewModel.swift
//  learningSwiftUI
//
//  Created by Julian González on 12/06/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var isValidName = true
    
    @Published var lastName = ""
    @Published var isValidLastName = true
    
    @Published var email = ""
    @Published var isValidEmail = true
    
    @Published var typeDocument = ""
    @Published var typeDocumentEnum: TypeDocument?
    @Published var isValidTypeDocument = true
    
    @Published var numberDocument = ""
    @Published var isValidNumberDocument = true
    
    @Published var birthDate: Date?
    @Published var isValidBirthDate = true
    
    @Published var numberPhone = ""
    @Published var isValidNumberPhone = true
    
    @Published var typeGender = ""
    @Published var typeGenderEnum: TypeGender?
    @Published var isValidGender = true
    
    @Published var isRealTime = false
    var cancellableSet: Set<AnyCancellable> = []
    
    var userDefaultHelper = UserDefaultHelper()
    
    init() {
        $name
            .receive(on: RunLoop.main)
            .map { name in
                return self.isRealTime ? name.count > 3 : true
            }
            .assign(to: \.isValidName, on: self)
            .store(in: &cancellableSet)
        
        $lastName
            .receive(on: RunLoop.main)
            .map { lastName in
                return self.isRealTime ? lastName.count > 3 : true
            }
            .assign(to: \.isValidLastName, on: self)
            .store(in: &cancellableSet)
        
        $email
            .receive(on: RunLoop.main)
            .map { email in
                return self.isRealTime ? email.isEmpty ? false : self.validateEmiil(email: email) : true
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellableSet)
        
        $typeDocument
            .receive(on: RunLoop.main)
            .map { typeDocument in
                return self.isRealTime ? typeDocument.count != 0 : true
            }
            .assign(to: \.isValidTypeDocument, on: self)
            .store(in: &cancellableSet)
        
        $numberDocument
            .receive(on: RunLoop.main)
            .map { numberDocument in
                return self.isRealTime ? numberDocument.count == 10 : true
            }
            .assign(to: \.isValidNumberDocument, on: self)
            .store(in: &cancellableSet)
        
        $birthDate
            .receive(on: RunLoop.main)
            .map { birthDate in
                return self.isRealTime ? birthDate == nil ? false : self.isLegalAge(birtDate: birthDate!) : true
            }
            .assign(to: \.isValidBirthDate, on: self)
            .store(in: &cancellableSet)
        
        //TODO: validación indicativo
        
        $numberPhone
            .receive(on: RunLoop.main)
            .map { numberPhone in
                return self.isRealTime ? numberPhone.count == 10 : true
            }
            .assign(to: \.isValidNumberPhone, on: self)
            .store(in: &cancellableSet)
        
        $typeGender
            .receive(on: RunLoop.main)
            .map { gender in
                return self.isRealTime ? gender != "" : true
            }
            .assign(to: \.isValidGender, on: self)
            .store(in: &cancellableSet)
    }
    
    
    func validationField() -> Bool {
        isValidName = name.count > 3
        isValidLastName = lastName.count > 3
        isValidEmail = validateEmiil(email: email)
        isValidTypeDocument = !typeDocument.isEmpty
        isValidNumberDocument = numberDocument.count == 10
        isValidBirthDate = birthDate == nil ? false : isLegalAge(birtDate: birthDate!)
        isValidNumberPhone = numberPhone.count == 10
        isValidGender = !typeGender.isEmpty
        
        return isValidName && isValidLastName && isValidEmail && isValidTypeDocument && isValidNumberDocument && isValidBirthDate && isValidNumberPhone && isValidGender
    }
    
    func saveProfile(profile: ProfileModel) {
        userDefaultHelper.saveProfile(profile: profile)
    }
    
    func validateEmiil(email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)
    }
    
    func isLegalAge(birtDate: Date) -> Bool {
        let years = Calendar.current.dateComponents([.year, .month, .day], from: birtDate, to: Date())
        return years.year! > 10
    }
}
