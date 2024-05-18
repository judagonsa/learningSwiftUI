//
//  ButtonHelper.swift
//  learningSwiftUI
//
//  Created by Julian González on 18/05/24.
//

import SwiftUI

extension Button {
    func buttonFooter(color: Color) -> some View {
        return self
            .font((.system(.title3, design: .rounded)))
            .bold()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .padding(.bottom, 30)
    }
}
