//
//  KAIWidget.swift
//  KAIWidget
//
//  Created by zm on 2025/1/2.
//

import Services
import SwiftUI
import WidgetKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: .now, configuration: .init())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: .now, configuration: configuration)
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        Timeline(entries: [SimpleEntry(date: .now, configuration: configuration)], policy: .atEnd)
    }

    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct KAIWidgetEntryView: View {
    var entry: Provider.Entry

    
    var body: some View {
        
     
        HStack {
            Image(nsImage: NSApplication.shared.applicationIconImage)

            VStack(alignment: .leading, spacing: 5) {

                HStack(spacing: 5) {
                    Text(Bundle.appName)
                        .font(.title2.bold())
                    
                    if Bundle.appVersionName.lowercased().contains(/beta|rc/) {
                        Image(systemName: "ladybug.fill")
                            .foregroundStyle(.teal)
                    } else {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundStyle(.tint)
                    }
                }
                
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
      
            }
            .padding()
        }

    }
}


struct KAIWidget: Widget {
    let kind: String = "KAIWidget"


    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            KAIWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
        
        
        
    }
}
