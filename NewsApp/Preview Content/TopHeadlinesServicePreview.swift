//
//
// TopHeadlinesServicePreview.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

/// For previews
struct TopHeadlinesServicePreview: TopHeadlinesProtocol {
    func getTopHeadlines() async throws -> [ArticleDO] {
        return [.mock]
    }
    
    func searchNews(by text: String) async throws -> [ArticleDO] {
        return [.mock]
    }
}

extension ArticleDO {
    static var mock: ArticleDO {
        .init(author: "Mohammad Jahjouh, Wafaa Shurafa, Melanie Lidman",
              title: "Hamas returns bodies of 4 Israeli hostages said to include a mother and her 2 young children - The Associated Press",
              description: "Hamas has handed over the bodies of four Israeli hostages, said to include a mother and her two children who have long been feared dead and had come to symbolize the nation’s agony following the Oct. 7, 2023, attack. The militant group said it released the re…",
              url: URL(string: "https://apnews.com/article/israel-palestinians-hamas-war-news-ceasefire-hostages-02-20-2025-4c2ffabae1771cff1a9542fddfaf7d07"),
              image: URL(string: "https://dims.apnews.com/dims4/default/e526e05/2147483647/strip/true/crop/6000x3375+0+312/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F1e%2Fdf%2F7ef062f6e65bcc5184c27f453333%2F78404add511541239e870f47a5f88383"),
              publishedAt: "2025-02-20T18:14:00Z",
              content: "TEL AVIV, Israel (AP) Hamas on Thursday released the bodies of four Israeli hostages, said to include a mother and her two children who have long been feared dead and had come to symbolize the nation… [+6624 chars]")
    }
}
