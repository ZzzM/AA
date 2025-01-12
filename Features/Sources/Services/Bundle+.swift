//
//  Bundle+.swift
//  Features
//
//  Created by zm on 2025/1/2.
//

import Foundation

extension Bundle {
    
    public static let assets = Bundle.module


    public static var appName: String {
        main.object(forInfoDictionaryKey: "CFBundleName") as! String
    }
    
    
    public static var appVersionName: String {
        main.object(forInfoDictionaryKey: "AppVersionName") as? String ?? "\(appVersion) (\(appBuild))"
    }


    public static var appVersion: String {
        main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }

    public static var appBuild: String {
        main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }

    public static var identifier: String {
        main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String
    }

    public static var copyright: String {
        main.object(forInfoDictionaryKey: "NSHumanReadableCopyright") as! String
    }

}

extension ProcessInfo {
    public static var osVersionName: String {
        
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
