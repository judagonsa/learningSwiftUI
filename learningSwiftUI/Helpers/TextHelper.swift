//
//  TextHelper.swift
//  learningSwiftUI
//
//  Created by Julian González on 18/05/24.
//

import SwiftUI

extension Text {
    func titleView () -> some View {
        return self
            .font(.system(.largeTitle, design: .rounded))
            .bold()
            .padding(.vertical, 20)
    }
}
