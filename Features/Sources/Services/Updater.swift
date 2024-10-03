//
//  Updater.swift
//  Features
//
//  Created by zm on 2024/9/26.
//

import Sparkle

public struct AppBundleKey {

    public let build = "CFBundleVersion"
    public let version = "CFBundleShortVersionString"
    public let identifier = "CFBundleIdentifier"
    public let name = "CFBundleName"
    public let copyright = "NSHumanReadableCopyright"

}

@dynamicMemberLookup
public enum AppBundle {

    static let shared = AppBundleKey()

    public static subscript<T>(dynamicMember keyPath: KeyPath<AppBundleKey, T>) -> T {
        let key = shared[keyPath: keyPath] as! String

        return Bundle.main.infoDictionary?[key] as! T

    }

}

public struct Updater {

    private static let shared = Updater()

    private let updaterController: SPUStandardUpdaterController

    init() {
        updaterController = .init(
            startingUpdater: false,
            updaterDelegate: .none,
            userDriverDelegate: .none
        )
    }

    public static func start() {
        shared.updaterController.startUpdater()
    }

    public static func check() {
        shared.updaterController.checkForUpdates(.none)
    }
}
