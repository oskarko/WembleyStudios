//
//
// TopHeadlinesResponse.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

struct TopHeadlinesResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}
