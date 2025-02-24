//
//
// Globals.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

var screenSize: CGSize {
    if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size {
        return screenSize
    }
    
    return .zero
}
