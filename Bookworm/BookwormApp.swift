//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Woodrow Martyr on 23/3/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
