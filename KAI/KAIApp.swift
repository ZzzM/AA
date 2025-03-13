//
//  KAIApp.swift
//  KAI
//
//  Created by zm on 2024/9/26.
//

import Features
import OSLog
import Services
import SwiftUI

@main
struct KAIApp: App {

    private let logger = Logger(subsystem: "KAI", category: String(describing: KAIApp.self))

    private let updater = Updater()
    
    
    var body: some Scene {
        WindowGroup {
            MainScreen(updater: updater)
                .environment(\.locale, .init(identifier: "en"))
                .task {
                    if let window = NSApp.mainWindow {
                        window.setContentSize(NSSize(width: 300, height: 320))
                        window.styleMask.remove(.resizable)
                    }
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
