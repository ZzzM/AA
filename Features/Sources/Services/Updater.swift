//
//  Updater.swift
//  Features
//
//  Created by zm on 2024/9/26.
//

import Sparkle
import SwiftUI

public class Updater: NSObject {

    private lazy var updaterController = SPUStandardUpdaterController(
        startingUpdater: false,
        updaterDelegate: self,
        userDriverDelegate: .none
    )
    
    @AppStorage("includeBetaChannel")
    public var includeBetaChannel = false
    
    public override init() {
        super.init()
        updaterController.startUpdater()
    }
    
    public func check() {
        updaterController.checkForUpdates(.none)
    }
}

extension Updater: SPUUpdaterDelegate {
    public func allowedChannels(for updater: SPUUpdater) -> Set<String> {
        includeBetaChannel ? ["beta"]:[]
    }
    
    public func feedURLString(for updater: SPUUpdater) -> String? {
        "https://raw.githubusercontent.com/ZzzM/AA/refs/heads/main/appcast.xml"
    }
}
