//
//  ProfileView.swift
//  learningSwiftUI
//
//  Created by Julian González on 16/05/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var name = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var typeDocument = ""
    @State private var numberDocument = ""
    @State private var numberPhone = ""
    @State private var gender = ""
    
    @State var visibleErrors = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                Text("Perfil")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .padding(.vertical, 20)
                
                FormTextFfield(nameField: "Nombre", valueField: $name)
                RequirementText(requirementText: "Mínimo 6 caracteres")
                
                FormTextFfield(nameField: "Apellido", valueField: $lastName)
                RequirementText(requirementText: "Mínimo 6 caracteres")
                
                FormTextFfield(nameField: "Correo", valueField: $email, isEmail: true)
                RequirementText(iconName: "mail.fill", requirementText: "Mínimo 6 caracteres, una mayúscula y un número")
                
                FormTextFfield(nameField: "Tipo de documento", valueField: $typeDocument) //seleccionable
                RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el tipo de documento")
                
                FormTextFfield(nameField: "Número de documento", valueField: $numberDocument)
                RequirementText(iconName: "candybarphone", requirementText: "Documento inválido")
                
                //seleccionar país (indicativo)
                FormTextFfield(nameField: "Número de teléfono", valueField: $numberPhone)
                RequirementText(iconName: "candybarphone", requirementText: "Número teléfonico inválido")
                
                FormTextFfield(nameField: "Género", valueField: $gender) //seleccionable
                RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el género")
                
                //vista de cambiar contraseña
                
                
                Spacer()
                Button {
                    print("Guardar inf")
                    //validar información
                    visibleErrors.toggle()
                } label: {
                    Text("Guardar")
                        .font((.system(.title3, design: .rounded)))
                        .bold()
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("primaryRed"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 30)
                .padding()
                
            }
        }
    }
}

struct FormTextFfield: View {
    var nameField = ""
    @Binding var valueField: String
    var isSecure = false
    var isEmail = false
    var isNumber = false
    var isSelected = false
    
    var body: some View {
        VStack {
            if isSecure {
                
            }else if isEmail {
                TextField(nameField, text: $valueField)
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .keyboardType(.emailAddress)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    }
            }else if isNumber{
                TextField(nameField, text: $valueField)
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .keyboardType(.numberPad)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    }
            } else {
                TextField(nameField, text: $valueField)
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
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
                .font(.system(.body, design: .rounded))
                .strikethrough(isVerified)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
