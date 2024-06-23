//
//  TabMenuView.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct MainMenuView: View {
    
    @StateObject var viewModel = MainMenuViewModel()
    @Bindable var appDataBindable: AppData = .init()
    
    @State var showSideMenu = false
    
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        NavigationStack {
            
            HStack(spacing: 0) {
                
                SideMenu(showMenu: $showSideMenu)
                
                    TabView(selection: $appDataBindable.activeTab){
                        
                        HomeView(showMenu: $showSideMenu)
                            .tag(Tab.home)
                        
                        Text("Cosas locas").tabItem {
                            Text("Other")
                        }.tag(Tab.new)
                        
                        ProfileView()
                            .tag(Tab.profile)
                    }
                    .overlay(alignment: .bottom) {
                        CustomTabBar(activeTab: $appDataBindable.activeTab)
                    }
                    .frame(width: getRect().width)
                
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset)
            .navigationBarTitleDisplayMode(.inline)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showSideMenu) { _, _ in
            if showSideMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showSideMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    MainMenuView()
}

//
