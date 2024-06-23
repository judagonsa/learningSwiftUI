//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var appData: AppData = .init()
    var body: some View {
        ZStack {
            TabMenuView()
                .environment(AppData())
            
            if !appData.isSplashFinish {
                SplashScreen()
            }
            
        }
        .environment(appData)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
        
}
