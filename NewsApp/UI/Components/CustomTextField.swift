//
//
// CustomTextField.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @FocusState var focused: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke()
            .frame(height: 50)
            .overlay {
                Color.textFieldBackground
                    .clipShape(.rect(cornerRadius: 10))
                    .contentShape(.rect)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.redNews)
                        .font(.title3)
                    TextField("Search", text: $text)
                        .focused($focused)
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.redNews)
                        .onTapGesture {
                            text.removeAll()
                        }
                        .disabledWithOpacity(text.isEmpty)
                }
                
                .padding(.horizontal)
            }
            .padding()
        
    }
}

#Preview {
    CustomTextField(text: .constant(""))
}
