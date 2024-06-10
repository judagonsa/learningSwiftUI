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
