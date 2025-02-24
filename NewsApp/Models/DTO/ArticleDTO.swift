//
//
// ArticleDTO.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

struct ArticleDTO: Codable {
    let source: SourceDTO?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

extension ArticleDTO {
    var toDO: ArticleDO {
        .init(author: author,
              title: title,
              description: description,
              url: URL(string: url ?? ""),
              image: URL(string: urlToImage ?? ""),
              publishedAt: publishedAt,
              content: content)
    }
}


