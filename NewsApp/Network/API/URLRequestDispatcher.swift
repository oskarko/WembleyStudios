//
//
// URLRequestDispatcher.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

struct URLRequestDispatcher {
    func doRequest<T: Decodable>(request: URLRequest) async throws -> T {
        var (data, response): (Data, URLResponse)
        
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw URLDispatchError.requestFailed
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLDispatchError.invalidResponse
        }
        
        if (200...299).contains(httpResponse.statusCode) {
            print("\(httpResponse.statusCode)")
        } else {
            if let errorData = try? JSONDecoder().decode(ErrorDTO.self, from: data) {
                throw errorData.toDO
            }
        }
        
        guard !data.isEmpty else {
            throw URLDispatchError.invalidData
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            print("✅ -> DATA RECEIVED")
            return decodedData
        } catch {
            throw URLDispatchError.errorDecodableWith(error)
        }
    }
}
