//
//
// ArticleCard.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct ArticleCard: View {
    let article: ArticleDO
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: article.image) { Image in
                if let image = Image.image {
                    image
                        .resizable()
                        .scaledToFit()
                }
            }
            Text(article.title ?? "")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .multilineTextAlignment(.leading)
        }
        .background(.darkPurple)
        .clipShape(.rect(cornerRadius: 20))
        .padding()
        .shadow(color: .darkPurple, radius: 5, x: 2, y: 1)
    }
}

#Preview {
    ArticleCard(article: .mock)
}
