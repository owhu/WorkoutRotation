//
//  StandardButtonModifier.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/18/24.
//

import SwiftUI

struct StandardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 352, height: 44)
            .background(.gray)
            .cornerRadius(8)
    }
}
