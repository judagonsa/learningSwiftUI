//
//  UserDefaultHelper.swift
//  learningSwiftUI
//
//  Created by Julian González on 19/06/24.
//

import Foundation

class UserDefaultHelper {
    func saveProfile(profile: ProfileModel) {
        if let encode = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.setValue(encode, forKey: "userProfile")
        }
    }
    
    func getProfile() -> ProfileModel? {
        if let profileData = UserDefaults.standard.object(forKey: "userProfile") as? Data {
            if let profile = try? JSONDecoder().decode(ProfileModel.self, from: profileData) {
                return profile
            }
        }
        return nil
    }
}
