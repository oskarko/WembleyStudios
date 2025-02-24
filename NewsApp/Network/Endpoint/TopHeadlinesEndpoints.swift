//
//
// TopHeadlinesEndpoints.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

enum TopHeadlinesEndpoints {
    case getAll
    case searchNews
    
    var path: String {
        switch self {
        case .getAll:
            "/v2/top-headlines"
        case .searchNews:
            "/v2/everything"
        }
    }
}
