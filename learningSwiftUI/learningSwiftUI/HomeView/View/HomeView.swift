//
//  HomeView.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            
            CustomTabBar()
        }
    }
}

#Preview {
    HomeView()
}
