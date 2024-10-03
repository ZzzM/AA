//
//  MainScreen.swift
//  Features
//
//  Created by zm on 2024/9/28.
//
import SwiftUI
import Services

public struct MainScreen: View {

    private let versionNumbers = "\(AppBundle.version) (\(AppBundle.build))"

    public init() {
        Updater.start()
    }
    
    public var body: some View {
        Text(L10n.version, bundle: .assets) + Text(versionNumbers).font(.largeTitle)

        Button(role: .destructive) {
            Updater.check()
        } label: {
            Text(L10n.checkForUpdates, bundle: .assets)
        }
    }

}
