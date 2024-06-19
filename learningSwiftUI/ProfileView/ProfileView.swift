//
//  ProfileView.swift
//  learningSwiftUI
//
//  Created by Julian González on 16/05/24.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text("Perfil")
                    .titleView()
                
                FormTextFfield(nameField: "Nombre", valueField: $viewModel.name)
                if !viewModel.isValidName {
                    RequirementText(requirementText: "Mínimo 3 caracteres")
                }
                
                FormTextFfield(nameField: "Apellido", valueField: $viewModel.lastName)
                if !viewModel.isValidLastName {
                    RequirementText(requirementText: "Mínimo 3 caracteres")
                }
                
                FormTextFfield(nameField: "Correo", valueField: $viewModel.email, isEmail: true)
                if !viewModel.isValidEmail {
                    RequirementText(iconName: "mail.fill", requirementText: "Mínimo 6 caracteres, una mayúscula y un número")
                }
                
                Menu {
                    Section("Tipo de documento") {
                        ForEach(TypeDocument.allCases) { document in
                            Button(document.name) {
                                viewModel.typeDocumentEnum = document
                                viewModel.typeDocument = document.name
                            }
                        }
                    }
                } label: {
                    FormTextFfield(nameField: "Tipo de documento", valueField: $viewModel.typeDocument)
                }
                
                if !viewModel.isValidTypeDocument {
                    RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el tipo de documento")
                }
                
                FormTextFfield(nameField: "Número de documento", valueField: $viewModel.numberDocument)
                if !viewModel.isValidNumberDocument {
                    RequirementText(iconName: "candybarphone", requirementText: "Documento inválido")
                }
                
                DatePickerHelper(placeHolder: "BirthDate", date: $viewModel.birthDate)
                    .textFormulary()
                if !viewModel.isValidBirthDate {
                    RequirementText(iconName: "candybarphone", requirementText: "favor selecciona la fecha de nacimiento")
                }
                
                //seleccionar país (indicativo) con un servicio
                FormTextFfield(nameField: "Número de teléfono", valueField: $viewModel.numberPhone)
                if !viewModel.isValidNumberPhone {
                    RequirementText(iconName: "candybarphone", requirementText: "Número teléfonico inválido")
                }
                Menu {
                    Section("Género") {
                        ForEach(TypeGender.allCases) { gender in
                            Button(gender.name) {
                                viewModel.typeGender = gender.name
                                viewModel.typeGenderEnum = gender
                            }
                        }
                    }
                } label: {
                    FormTextFfield(nameField: "Género", valueField: $viewModel.typeGender)
                }
                if !viewModel.isValidGender {
                    RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el género")
                }
                
                Spacer()
                Button {
                    if viewModel.validationField() {
                        //TODO: guardar información en teléfono
                        print("guardar información")
                    }else {
                        viewModel.isRealTime = true
                    }
                } label: {
                    Text("Guardar")
                }
                .buttonFooter(color: Color("primaryRed"))
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
