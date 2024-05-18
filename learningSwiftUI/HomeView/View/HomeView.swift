//
//  HomeView.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(AppData.self) private var appData
    @Bindable var appDataBindable: AppData = .init()
    
    var body: some View {
        TabView(selection: $appDataBindable.activeTab){
            
            Text("Home").tabItem {
                Text("Home")
            }.tag(Tab.home)
            
            Text("Cosas locas").tabItem {
                Text("Other")
            }.tag(Tab.new)
            
            ProfileView().tabItem {
                Text("profile")
            }.tag(Tab.profile)
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(activeTab: $appDataBindable.activeTab)
        }
    }
}

#Preview {
    HomeView()
        .environment(AppData())
}

//
