//
//
// RequestBuilder.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

struct RequestBuilder {
    let baseURL: String
    let completeURL: String
    let url: URL?
    let queryItems: [URLQueryItem]?
    let headers: [String: String]?
    let data: Data?
    let method: HttpMethod
    let handleCookies: Bool
    
    init(endpoint: String, baseURL: String, method: HttpMethod, data: Data? = nil, queryItems: [URLQueryItem]? = nil, headers: [String: String]? = nil, handleCookies: Bool = false) {
        self.baseURL = baseURL
        self.completeURL = baseURL + endpoint
        self.url = URL(string: completeURL)
        self.data = data
        self.queryItems = queryItems
        self.headers = headers
        self.method = method
        self.handleCookies = handleCookies
    }
    
    func buildURLRequest() async throws -> URLRequest {
        guard let _ = self.url else {
            throw URLDispatchError.requestFailed
        }
        
        var urlComponents = URLComponents(string: self.completeURL)
        
        if let queryItems {
            urlComponents?.queryItems = queryItems
        }
        
        guard let finalURL = urlComponents?.url else {
            throw URLDispatchError.requestFailed
        }
        
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 180
        
        if let data, method == .post {
            urlRequest.httpBody = data
        }
        
        if let headers {
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if handleCookies {
            urlRequest.httpShouldHandleCookies = true
        }
        print("📞 -> New Request: \(urlRequest.url?.absoluteString ?? "No URL")")
        return urlRequest
    }
}
