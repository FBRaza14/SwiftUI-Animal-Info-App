//
//  CenterModifier.swift
//  Africa
//
//  Created by Fahad Bin Raza on 07/09/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
