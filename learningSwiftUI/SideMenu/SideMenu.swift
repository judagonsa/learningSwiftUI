//
//  SideMenu.swift
//  learningSwiftUI
//
//  Created by Julian González on 22/06/24.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack (alignment: .top ) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .clipShape(.circle)
                    
                    Text("Name")
                        .font(.title2.bold())
                    
                    Text("Teléfono")
                        .font(.callout)
                    
                }
                Spacer()
                
                Button {
                    showMenu.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack (alignment: .leading, spacing: 40) {
                        TabButton(icon: "person.crop.circle", title: "Perfil")
                        TabButton(icon: "gearshape.fill", title: "Configuración")
                        
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 20)
                    
                    Divider()
                    
                    TabButton(icon: "info.circle", title: "Acerca de")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
                    VStack (alignment: .leading, spacing: 40) {
                        TabButton(icon: "person.crop.circle", title: "Política y privacidad")
                        TabButton(icon: "lock.shield", title: "Tratamiendo de datos")
                        
                    }
                    .padding()
                    .padding(.leading)
                    
                    Divider()
                    
                    TabButton(icon: "questionmark.circle", title: "Centro de ayuda")
                        .padding()
                        .padding(.leading)
                }
                
            }
            
            Divider()
            VStack {
                Text("Ekilibra Spa")
                    .font(.callout)
                
                Text("Version App")
                    .font(.caption2)
            }
            .opacity(0.5)
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight:  .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    
    @ViewBuilder
    func TabButton(icon: String, title: String) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                
                Text(title)
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
