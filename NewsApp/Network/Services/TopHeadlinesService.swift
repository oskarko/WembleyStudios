//
//
// TopHeadlinesService.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

protocol TopHeadlinesProtocol {
    func getTopHeadlines() async throws -> [ArticleDO]
    func searchNews(by text: String) async throws -> [ArticleDO]
}

struct TopHeadlinesService: TopHeadlinesProtocol {
    
    let baseUrl = InfoManager.readProperty(forKey: .baseURL) ?? ""
    let apiKey = InfoManager.readProperty(forKey: .apiKey)
    
    func getTopHeadlines() async throws -> [ArticleDO] {
        let request = try await RequestBuilder(endpoint: TopHeadlinesEndpoints.getAll.path,
                                               baseURL: baseUrl,
                                               method: .get,
                                               queryItems: [
                                                .init(name: "country", value: "us"),
                                                .init(name: "apiKey", value: apiKey)
                                               ])
            .buildURLRequest()
        
        let response: TopHeadlinesResponse = try await URLRequestDispatcher().doRequest(request: request)
        
        return response.articles.map(\.toDO)
    }
    
    func searchNews(by text: String) async throws -> [ArticleDO] {
        let request = try await RequestBuilder(endpoint: TopHeadlinesEndpoints.searchNews.path,
                                               baseURL: baseUrl,
                                               method: .get,
                                               queryItems: [
                                                .init(name: "q", value: text),
                                                .init(name: "apiKey", value: apiKey)
                                               ])
            .buildURLRequest()
        
        let response: TopHeadlinesResponse = try await URLRequestDispatcher().doRequest(request: request)
        
        return response.articles.map { $0.toDO }
    }
}
