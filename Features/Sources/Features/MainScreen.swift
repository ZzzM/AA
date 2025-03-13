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
                    
                    HStack {
                        Text("FeedURL")
                        Spacer()
                        if let url = updater.feedURL {
                            Button {
                                NSWorkspace.shared.open(url)
                            } label: {
                                Text(url.absoluteString)
                                    .multilineTextAlignment(.trailing)
    
                            }
                            .buttonStyle(.link)
                        }
                        
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
            .frame(height: 160)

        
            Button {
                updater.check()
            } label: {
                Text(L10n.checkForUpdates, bundle: .assets)
            }
            
           // .tint(.accentColor)

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()

    }

}
