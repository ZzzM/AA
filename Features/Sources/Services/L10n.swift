//
//  L10n.swift
//  Features
//
//  Created by zm on 2024/9/27.
//

import SwiftUI

public struct L10nKey {
    public let version = "version"
    public let checkForUpdates = "checkForUpdates"
}

@dynamicMemberLookup
public enum L10n {

    private static let shared = L10nKey()

    @available(macOS 13, *)
    public static subscript(dynamicMember keyPath: KeyPath<L10nKey, String>)
        -> LocalizedStringResource
    {
        let key = shared[keyPath: keyPath]
        return LocalizedStringResource(.init(key), bundle: .atURL(Bundle.module.bundleURL))

    }

    public static subscript(dynamicMember keyPath: KeyPath<L10nKey, String>)
        -> LocalizedStringKey
    {
        let key = shared[keyPath: keyPath]
        return LocalizedStringKey(key)
    }

}

