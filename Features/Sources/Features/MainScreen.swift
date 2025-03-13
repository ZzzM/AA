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
                .resizable()
                .frame(width: 60, height: 60)

            Text(Bundle.appName)
                .font(.title2.bold())

            List {

                Section {
                    HStack {
                        Text(L10n.version, bundle: .assets)
                        Spacer()
                        Text(Bundle.appVersionName)
                    }

                    HStack {
                        Text("Build")
                        Spacer()
                        Text(Bundle.appBuild)
                    }

                    HStack {
                        Text("macOS")
                        Spacer()
                        Text(ProcessInfo.osVersionName)
                    }

                    Toggle(
                        isOn: Binding(
                            get: {
                                includeBetaChannel
                            },
                            set: {
                                includeBetaChannel = $0
                            }
                        )
                    ) {
                        Text("Beta")
                    }
                    .toggleStyle(.switch)
                } footer: {
                    EmptyView()
                }

            }
            .frame(height: 115)

            Button {
                updater.check()
            } label: {
                Text(L10n.checkForUpdates, bundle: .assets)
            }

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()

    }

}
