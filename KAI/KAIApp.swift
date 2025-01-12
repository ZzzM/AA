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
    
//    init() {
//
//        let url = Bundle.main.url(forResource: "apps", withExtension: .none)
//        guard let url, let content = try? String(contentsOf: url, encoding: .utf8).trimmingCharacters(in: .newlines)
//        else {
//            return
//        }
//
//        for arr in content.components(separatedBy: .newlines) {
//
//            let source = arr.components(separatedBy: "$$")
//            precondition(source.count == 3)
//            let model = (name: source[0], es: source[1], link: source[2])
//            print(model.name, model.es, model.link)
//        }
//    }

    var body: some Scene {
        WindowGroup {
            MainScreen(updater: updater)
                .environment(\.locale, .init(identifier: "en"))
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
