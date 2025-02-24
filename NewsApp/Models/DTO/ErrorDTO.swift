//
//
// ErrorDTO.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

struct ErrorDTO: Codable {
    let status: String
    let code: String
    let message: String
}

extension ErrorDTO {
    var toDO: CommonError {
        .init(message: message)
    }
}
