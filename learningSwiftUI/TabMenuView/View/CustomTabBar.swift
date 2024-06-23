//
//  CustomTabBar.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var activeTab: Tab
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                ForEach(Tab.allCases, id:\.rawValue){ tab in
                    Button {
                        activeTab = tab
                    }label: {
                        TabItem(tint: Color("primaryRed"), inactiveTint: .gray, tab: tab, activeTab: $activeTab)
                    }
                }
            }
            .padding(.bottom, 10)
            .padding(.top, 6)
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    CustomTabBar(activeTab: .constant(.home))
        .environment(AppData())
        .preferredColorScheme(.dark)
}
