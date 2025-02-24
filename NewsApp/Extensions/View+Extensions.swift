//
//
// View+Extensions.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

@MainActor
extension View {
    var safeArea: UIEdgeInsets {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        return .zero
    }
    
    @ViewBuilder
    func backGroundHeader<Fill: ShapeStyle>(_ fill: Fill) -> some View {
        self
            .background {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(fill)
                        .padding(.horizontal, -15)
                    
                    Divider()
                }
                .padding(.top, -(safeArea.top + 15))
            }
    }
    
    @ViewBuilder
    func disabledWithOpacity(_ condition: Bool) -> some View {
        self
            .opacity(condition ? 0.3 : 1)
            .disabled(condition)
    }
    
    @ViewBuilder
    func imageWithScale(minY: CGFloat, scale: CGFloat) -> some View {
        self
            .background(GeometryReader { proxy in
                Color.clear.preference(key: ImageHeightPreferenceKey.self, value: proxy.size.height)
            })
            .scaleEffect(minY > 0 ? scale : 1)
    }
}
