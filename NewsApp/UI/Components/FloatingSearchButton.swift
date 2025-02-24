//
//
// FloatingSearchButton.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct FloatingSearchButton: View {
    @State private var tapSearchButton: Bool = false
    @Binding var searchText: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        Capsule()
            .frame(width: tapSearchButton ? (screenSize.width) - 20 : 60, height: 60)
            .foregroundStyle(tapSearchButton ? .textFieldBackground : .redNews)
            .padding()
            .overlay {
                Capsule()
                    .stroke()
                    .frame(width: tapSearchButton ? (screenSize.width) - 20 : 60, height: 60)
                HStack(spacing: 0) {
                    if tapSearchButton {
                        TextField("Search", text: $searchText)
                            .focused($isFocused)
                            .onSubmit {
                                self.tapSearchButton.toggle()
                                self.isFocused = false
                            }
                            .padding(.horizontal)
                    }
                    Button {
                        if !tapSearchButton {
                            self.tapSearchButton.toggle()
                            self.isFocused.toggle()
                        } else {
                            self.searchText = ""
                        }
                    } label: {
                        Image(systemName: tapSearchButton ? "xmark.circle" : "magnifyingglass")
                            .foregroundStyle(tapSearchButton ? .redNews : .white)
                            .padding()
                            .transition(.move(edge: .bottom))
                    }
                    .disabledWithOpacity(searchText.isEmpty && tapSearchButton)
                    
                }
                .padding()
            }
            .animation(.default, value: tapSearchButton)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .onChange(of: isFocused, perform: { newValue in
                if !newValue {
                    self.tapSearchButton = false
                }
            })
            .onDisappear {
                self.tapSearchButton = false
            }
    }
}

#Preview {
    FloatingSearchButton(searchText: .constant(""))
}
