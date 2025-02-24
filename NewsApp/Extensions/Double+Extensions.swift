//
//
// Double+Extensions.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

@MainActor
extension Double {
    /// For header animation
    static func headerBGOpacity(_ proxy: GeometryProxy, view: any View) -> CGFloat {
        let minY = proxy.frame(in: .global).minY + view.safeArea.top
        
        return minY > 0 ? 0 : (-minY / 15)
    }
}
