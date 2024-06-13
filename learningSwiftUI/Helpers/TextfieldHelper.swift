//
//  TextfieldHelper.swift
//  learningSwiftUI
//
//  Created by Julian González on 16/05/24.
//

import SwiftUI

extension TextField {
    func textFormulary() -> some View {
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .multilineTextAlignment(.leading)
    }
}

extension UIViewRepresentable {
    func textFormulary() -> some View {
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .multilineTextAlignment(.leading)
    }
}

struct FormTextFfield: View {
    var nameField = ""
    @Binding var valueField: String
    var isSecure = false
    var isEmail = false
    var isNumber = false
    
    var body: some View {
        VStack {
            if isSecure {
                //TODO: Contraseña segura
            }else if isEmail {
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                    .keyboardType(.emailAddress)
                
            }else if isNumber{
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                    .keyboardType(.numberPad)
                
            }else {
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                
            }
        }
    }
}

struct RequirementText: View {
    
    //error: xmark.circle.fill
    //bien: checkmark.circle.fill
    var iconName = "xmark.circle.fill"
    var iconColor = Color("primaryRed")
    var requirementText = ""
    var isVerified = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            Text(requirementText)
                .foregroundStyle(.secondary)
                .font(.system(.footnote, design: .rounded))
                .strikethrough(isVerified)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
        .padding(.top, -5)
    }
}
