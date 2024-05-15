//
//  CustomTabBar.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Environment(AppData.self) private var appData
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id:\.rawValue){ tab in
                Button {
                    appData.activeTab = tab
                } label: {
                    VStack(spacing: 2) {
                        Image(
                            systemName: appData.activeTab == tab
                            ? "\(tab.icon).fill"
                            : tab.icon
                        )
                        .font(.title3)
                        .frame(width: 35, height: 35)
                        
                        Text(tab.rawValue)
                            .font(.caption2)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                    .opacity(appData.activeTab == tab ? 1 : 0.8)
                }
            }
        }
        .padding(.bottom, 10)
        .padding(.top, 5)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    HomeView()
        .environment(AppData())
        .preferredColorScheme(.dark)
}
