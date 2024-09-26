//
//  ViewController.swift
//  KAI
//
//  Created by zm on 2021/12/31.
//

import Cocoa
import SwiftUI

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

    func foo(x: String, y: String) {
        let a = 10
        if a > 11 {

        } else {

        }

    }

}

class ViewController: NSViewController {
    @IBOutlet var tt: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        tt.stringValue = "Version \(AppBundle.version) (\(AppBundle.build))"

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

}
