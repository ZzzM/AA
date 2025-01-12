//
//  KAIWidgetBundle.swift
//  KAIWidget
//
//  Created by zm on 2025/1/2.
//

import WidgetKit
import SwiftUI

@main
struct KAIWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        KAIWidget()
    }
}
