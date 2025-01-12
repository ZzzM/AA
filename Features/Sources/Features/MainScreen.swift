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
  
            Text("macOS " + ProcessInfo.osDisplayVersion)
            
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

extension ProcessInfo {
    static var osDisplayVersion: String {
        
        let os = processInfo.operatingSystemVersion
        
        
        var version = "\(os.majorVersion).\(os.minorVersion)"
        if !os.patchVersion.isMultiple(of: 0) {
            version += ".\(os.patchVersion)"
        }
   
        var osString = ProcessInfo.processInfo.operatingSystemVersionString.dropLast()
        var value = osString.removeLast()
        var build = ""
       
        while value.isNumber || value.isUppercase {
            build = String(value) + build
            value = osString.removeLast()
        }
        
        return "\(version) (\(build))"
    }
}
