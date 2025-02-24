//
//
// ErrorView.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let action: () -> Void
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.redNews)
            
            Text("Error")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
            
            Button{
                action()
            } label: {
                Text("OK")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.redNews)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
    }
}

#Preview {
    ErrorView(message: "Preview Error Message", action: {})
}
