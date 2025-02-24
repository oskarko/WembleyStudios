//
//
// ErrorManager.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import SwiftUI

/// Error manager is responsible for managing when to display the error popup.
@MainActor
final class ErrorManager: ObservableObject {
    @Published var commonError: CommonError? {
        didSet {
            isPopupShowed = true
        }
    }
    @Published public var isPopupShowed: Bool = false
    
    func setup(_ error: Error) {
        self.isPopupShowed = false
        if let commonError = error as? CommonError {
            self.commonError = commonError
        }
    }
    
    func getPopup() -> some View {
        if let commonError {
            return AnyView(
                ErrorView(message: commonError.message) {
                    self.isPopupShowed = false
                }
            )
        }
        return AnyView(
            ProgressView()
        )
    }
}
