//
//  Tab.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case new = "New & Hot"
    case profile = "My Netflix"
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .new:
            return "play.rectangle.on.rectangle"
        case .profile:
            return "person.crop.circle"
        }
    }
}
