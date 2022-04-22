//
//  ViewController.swift
//  KAI
//
//  Created by zm on 2021/12/31.
//

import Cocoa

extension Bundle {
    var bundleName: String? {
        infoDictionary?["CFBundleName"] as? String
    }

    var version: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var build: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }

    var commitHash: String? {
        infoDictionary?["CommitHash"] as? String
    }

    var commitDate: String? {
        infoDictionary?["CommitDate"] as? String
    }

    var humanReadableCopyright: String? {
        infoDictionary?["NSHumanReadableCopyright"] as? String
    }

}

class ViewController: NSViewController {

    @IBOutlet weak var tt: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let main = Bundle.main
        tt.stringValue = """
                Version \(main.version ?? "XX")
                Hash \(main.commitHash ?? "XX")
                Date \(main.commitDate ?? "XX")
                Build \(main.build ?? "XX")
        """

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

