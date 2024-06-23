//
//  TabItem.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct TabItem: View {
    
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    @Binding var activeTab: Tab
    
    var body: some View {
        VStack(spacing: 2) {
            Image(
                systemName: activeTab == tab
                ? "\(tab.icon).fill"
                : tab.icon
            )
            .font(activeTab == tab ? .title : .title3)
            .frame(width: 35, height: 35)
            
            Text(tab.rawValue)
                .foregroundStyle(
                    activeTab == tab
                    ? Color(tint)
                    : Color(inactiveTint)
                )
                .font(.caption2)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.red)
        .opacity(activeTab == tab ? 1 : 0.7)
    }
}

#Preview {
    TabItem(tint: .red, inactiveTint: Color.gray, tab: .home, activeTab: .constant(.home))
}
