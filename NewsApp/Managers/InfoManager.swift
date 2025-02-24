//
//
// InfoManager.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

enum InfoDictionaryKey: String {
    case baseURL = "BaseUrl"
    case apiKey = "ApiKey"
}

struct InfoManager {
    static func readProperty(forKey key: InfoDictionaryKey) -> String? {
        guard let baseUrl = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else { return nil }
        return baseUrl
    }
}
