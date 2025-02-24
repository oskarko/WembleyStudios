//
//
// ArticleDO.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

struct ArticleDO: Identifiable, Hashable, Equatable {
    let id: UUID = .init()
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let image: URL?
    let publishedAt: String?
    let content: String?
}
