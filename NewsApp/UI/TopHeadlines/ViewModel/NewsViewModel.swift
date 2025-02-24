//
//
// NewsViewModel.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//


import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    //MARK: Properties
    @Published var articles: [ArticleDO] = []
    @Published var setupError: Bool = false
    @Published var error: Error? = nil
    
    //MARK: Service
    private let topHeadlinesService: TopHeadlinesProtocol
    
    init(topHeadlinesService: TopHeadlinesProtocol = TopHeadlinesService()) {
        self.topHeadlinesService = topHeadlinesService
        self.getTopHeadlines()
    }
    
    func getTopHeadlines() {
        Task {
            do {
                self.articles = try await self.topHeadlinesService.getTopHeadlines()
                self.setupError = false
            } catch {
                self.error = error
                self.setupError = true
            }
        }
    }
    
    func searchNews(by text: String) {
        Task {
            do {
                self.articles = try await self.topHeadlinesService.searchNews(by: text)
                self.setupError = false
            } catch {
                self.error = error
                self.setupError = true
            }
        }
    }
}
