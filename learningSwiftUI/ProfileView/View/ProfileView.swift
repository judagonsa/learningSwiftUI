//
//  ProfileView.swift
//  learningSwiftUI
//
//  Created by Julian González on 16/05/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var name = ""
    @State private var isValidName = true
    
    @State private var lastName = ""
    @State private var isValidLastName = true
    
    @State private var email = ""
    @State private var isValidNEmail = true
    
    @State private var typeDocument = ""
    @State private var isValidTypeDocument = true
    
    @State private var numberDocument = ""
    @State private var isValidNumberDocument = true
    
    @State private var birthDate: Date?
    @State private var isValidBirthDate = true
    
    @State private var numberPhone = ""
    @State private var isValidNumberPhone = true
    
    @State private var gender = ""
    @State private var isValidGender = true
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                Text("Perfil")
                    .titleView()
                
                FormTextFfield(nameField: "Nombre", valueField: $name)
                if !isValidName {
                    RequirementText(requirementText: "Mínimo 3 caracteres")
                }
                
                FormTextFfield(nameField: "Apellido", valueField: $lastName)
                if !isValidLastName {
                    RequirementText(requirementText: "Mínimo 3 caracteres")
                }
                
                FormTextFfield(nameField: "Correo", valueField: $email, isEmail: true)
                if !isValidNEmail {
                    RequirementText(iconName: "mail.fill", requirementText: "Mínimo 6 caracteres, una mayúscula y un número")
                }
                
                FormTextFfield(nameField: "Tipo de documento", valueField: $typeDocument) //seleccionable
                if !isValidTypeDocument {
                    RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el tipo de documento")
                }
                
                FormTextFfield(nameField: "Número de documento", valueField: $numberDocument)
                if !isValidNumberDocument {
                    RequirementText(iconName: "candybarphone", requirementText: "Documento inválido")
                }
                
                DatePickerHelper(placeHolder: "BirthDate", date: $birthDate)
                if !isValidBirthDate {
                    RequirementText(iconName: "candybarphone", requirementText: "favor selecciona la fecha de nacimiento")
                }
                
                //seleccionar país (indicativo)
                FormTextFfield(nameField: "Número de teléfono", valueField: $numberPhone)
                if !isValidNumberPhone {
                    RequirementText(iconName: "candybarphone", requirementText: "Número teléfonico inválido")
                }
                
                FormTextFfield(nameField: "Género", valueField: $gender) //seleccionable
                if !isValidGender {
                    RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el género")
                }
                
                //vista de cambiar contraseña
                
                
                Spacer()
                Button {
                    if validateInformation() {
                        print("Guardar inf")
                    }else {
                        print("Algo anda mal")
                    }
                } label: {
                    Text("Guardar")
                }
                .buttonFooter(color: Color("primaryRed"))
                
            }
        }
    }
    
    func validateInformation() -> Bool {
        var isValidateInformation =  false
        
        isValidName = name.count > 3
        isValidLastName = lastName.count > 3
        //TODO: validar correo (video tutorial)
        //TODO: tipo de documento
        //TODO: fecha de nacimiento mayor a 12 años
        isValidNumberDocument = numberDocument.count > 9
        isValidNumberPhone = numberPhone.count == 10
        //TODO: seleccionar género
        
        return false
    }
}

struct FormTextFfield: View {
    var nameField = ""
    @Binding var valueField: String
    var isSecure = false
    var isEmail = false
    var isNumber = false
    var isBirtDate = false
    
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
                
            }else if isBirtDate {
                
                
            }else {
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                
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
                .font(.system(.footnote, design: .rounded))
                .strikethrough(isVerified)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
        .padding(.top, -5)
    }
}

#Preview {
    ProfileView()
}
