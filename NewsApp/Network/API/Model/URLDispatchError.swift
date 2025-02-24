//
//
// URLDispatchError.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

enum URLDispatchError: Error, LocalizedError {
    
    case invalidData
    case invalidResponse
    case jsonDecodingError
    case requestFailed
    case errorDecodableWith(Error)
    
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return "The data received is invalid"
        case .invalidResponse:
            return "Invalid response"
        case .jsonDecodingError:
            return "Error while parsing JSON data"
        case .requestFailed:
            return "Request failed"
        case .errorDecodableWith(let message): return "Error while decoding object. Check your DTO. Error message: \(message.localizedDescription)."
        }
    }
}
