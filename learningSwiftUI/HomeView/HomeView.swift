//
//  HomeView.swift
//  learningSwiftUI
//
//  Created by Julian González on 22/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack { 
            Button("Show Menu") {
                showMenu.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                if showMenu {
                    showMenu.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
