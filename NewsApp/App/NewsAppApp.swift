//
//
// NewsAppApp.swift
//
//
// Created by Oscar R. Garrucho.
// LinkedIn: https://www.linkedin.com/oscar-garrucho/
// Copyright © 2025 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

@main
struct NewsAppApp: App {
    @StateObject private var errorManager: ErrorManager = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(errorManager)
        }
    }
}
