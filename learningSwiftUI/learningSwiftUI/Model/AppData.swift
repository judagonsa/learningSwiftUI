//
//  AppData.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

@Observable
class AppData {
    var isSplashFinish: Bool = false
    var activeTab: Tab = .home
}
