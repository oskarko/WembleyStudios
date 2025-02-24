//
//
// ArticleDetailView.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.dismiss) private var dismiss
    // Properties
    @State private var imageHeight: CGFloat = .zero
    let article: ArticleDO
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        let minY = geometry.frame(in: .global).minY
                        let scale = min(1 + minY / 500, 1.5)
                        AsyncImage(url: article.image) { Image in
                            Image
                                .resizable()
                                .scaledToFit()
                                .clipped()
                                .imageWithScale(minY: minY, scale: scale)
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .foregroundStyle(.white)
                                .background(.darkPurple, in: .rect(cornerRadius: 50))
                                .imageWithScale(minY: minY, scale: scale)
                        }
                        .offset(y: minY > 0 ?  -minY : 0)
                    }
                    .frame(height: imageHeight)
                    
                    Text(article.title ?? "")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .padding()
                }
                .background(.darkPurple)
                
                Text(article.content ?? "Content not available")
                    .lineSpacing(8)
                    .padding()
            }
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .padding()
                    .background(.redNews, in: .circle)
                    .padding(.leading, 3)
                    .padding(.top, 30)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            
            if let url = article.url {
                Link(destination: url) {
                    Capsule()
                        .frame(width: 250, height: 60)
                        .shadow(color: .gray, radius: 8, x: 3, y: 1)
                        .tint(.redNews)
                        .overlay {
                            HStack {
                                Text("See full content in safari")
                                
                                Image(systemName: "safari")
                            }
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 50)
            }
        }
        .onPreferenceChange(ImageHeightPreferenceKey.self) { newHeight in
            imageHeight = newHeight
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        
    }
}

#Preview {
    ArticleDetailView(article: .mock)
}

