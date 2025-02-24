//
//
// ContentView.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI
import Lottie
import Combine

struct ContentView: View {
    @EnvironmentObject var errorManager: ErrorManager
    @StateObject var viewModel: NewsViewModel = .init()
    // Properties
    @Namespace private var topID
    @State private var isLoading: Bool = true
    @State private var searchText: String = ""
    @State private var filterText: String = ""
    let searchPublisher = PassthroughSubject<String, Never>()
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { reader in
                ScrollView {
                    //MARK: Header
                    HStack {
                        Text("News")
                            .font(.title.bold())
                            .foregroundStyle(.redNews)
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .id(topID)
                    
                    //MARK: Search Button
                    CustomTextField(text: $searchText)
                    
                    //MARK: Articles
                    ForEach(viewModel.articles) { article in
                        NavigationLink {
                            ArticleDetailView(article: article)
                                .onAppear {
                                    
                                }
                        } label: {
                            ArticleCard(article: article)
                        }
                    }
                }
                .blur(radius: isLoading ? 100 : 0)
                .overlay {
                    if isLoading {
                        ZStack {
                            LottieView(animation: .named("loading"))
                                .playing(loopMode: .repeat(1))
                                .animationDidFinish { completed in
                                    self.isLoading = false
                                }
                        }
                    } else {
                        //MARK: Floating Search Button
                        FloatingSearchButton(searchText: $searchText)
                        
                        if errorManager.isPopupShowed {
                            errorManager.getPopup()
                        }
                    }
                    
                }
                .animation(.snappy, value: isLoading)
                .animation(.snappy, value: errorManager.isPopupShowed)
                .onChange(of: searchText, perform: { newValue in
                    searchPublisher.send(newValue)
                    if newValue.count == 1 {
                        withAnimation {
                            reader.scrollTo(topID)
                        }
                    }
                })
                .onReceive(searchPublisher.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main), perform: { text in
                    if !text.isEmpty && text != " " {
                        self.filterText = text
                        self.viewModel.searchNews(by: self.filterText)
                    } else if text != " " {
                        self.viewModel.getTopHeadlines()
                    }
                })
                .onChange(of: viewModel.setupError) { newValue in
                    if let error = viewModel.error, newValue {
                        self.errorManager.setup(error)
                        self.viewModel.error = nil
                        self.viewModel.setupError = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: .init(topHeadlinesService: TopHeadlinesServicePreview()))
        .environmentObject(ErrorManager())
}






