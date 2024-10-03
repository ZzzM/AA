//
//  KAIApp.swift
//  KAI
//
//  Created by zm on 2024/9/26.
//

import Features
import OSLog
import SwiftUI

@main
struct KAIApp: App {

    private let log = Logger(subsystem: "KAI", category: String(describing: KAIApp.self))

    var body: some Scene {
        WindowGroup {
            MainScreen()
                .task {
                    await Task.waitTillCancel()
                    NSApplication.shared.terminate(.none)
                }
        }

    }
}

extension Task where Success == Void, Failure == Never {
    static func waitTillCancel() async {
        let asyncStream = AsyncStream<Int> { _ in }
        for await _ in asyncStream {}
    }
}


