//
//  HomeViewModel.swift
//  learningSwiftUI
//
//  Created by Julian González on 23/06/24.
//

import SwiftUI

class MainMenuViewModel: ObservableObject {
    
    var userDefaultHelper = UserDefaultHelper()
    
    func loadProfile() -> ProfileModel? {
        return userDefaultHelper.getProfile()
    }
}
