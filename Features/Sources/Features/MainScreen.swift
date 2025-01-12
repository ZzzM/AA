import Services
//
//  MainScreen.swift
//  Features
//
//  Created by zm on 2024/9/28.
//
import SwiftUI

public struct MainScreen: View {

    private let updater: Updater


    @State
    private var includeBetaChannel: Bool {
        didSet {
            updater.includeBetaChannel = includeBetaChannel
        }
    }

    public init(updater: Updater) {
        self.updater = updater
        self.includeBetaChannel = updater.includeBetaChannel
    }

    public var body: some View {
        VStack {

            Image(nsImage: NSApplication.shared.applicationIconImage)

            Text(Bundle.appName)
                .font(.title)

            Text(L10n.version, bundle: .assets) +
            Text(" " + Bundle.appVersionName)
  
            Text("macOS " + ProcessInfo.osVersionName)
            
            Toggle(
                "Beta Channel",
                isOn: Binding(
                    get: {
                        includeBetaChannel
                    },
                    set: {
                        includeBetaChannel = $0
                    }
                )
            )
            .toggleStyle(.switch)
            
            Button(role: .destructive) {
                updater.check()
            } label: {
                Text(L10n.checkForUpdates, bundle: .assets)
            }

           
     
            

        }

    }


}

