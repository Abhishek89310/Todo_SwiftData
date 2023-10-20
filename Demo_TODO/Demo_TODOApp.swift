//
//  Demo_TODOApp.swift
//  Demo_TODO
//
//  Created by Matrix on 06/10/23.
//

import SwiftUI
import SwiftData

@main
struct Demo_TODOApp: App {
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Item.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}

