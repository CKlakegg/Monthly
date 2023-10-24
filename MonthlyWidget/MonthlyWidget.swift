//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Caroline Klakegg on 23/10/2023.
//

import WidgetKit
import SwiftUI
import Intents


struct Provider: IntentTimelineProvider {
    //shows when wigdet doens't have any data
    func placeholder(in context: Context) ->  DayEntry {
         DayEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping ( DayEntry) -> ()) {
        let entry =  DayEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
//The timeline gets created 
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ DayEntry] = []

        // Generate a timeline consisting of seven entries a day apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry =  DayEntry(date: startOfDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct  DayEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct MonthlyWidgetEntryView : View {
    var entry: DayEntry
    var config: MonthlyConfig

    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthlyConfig.determineConfig(from: entry.date)
 
    }

    var body: some View {
        ZStack{
            
            ContainerRelativeShape()
                .fill(config.backgroundColor)
            
            VStack {
                HStack{
                    Spacer()
                    Text(config.emojiText)
                        .font(.title)
                    Text(entry.date.weekdayDisplayFormat)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(config.weekdayTextColor)
                    Spacer()
                    
                }
                Text(entry.date.dayDisplyFormat)
                    .foregroundColor(config.dayTextColor)
                    .font(.system(size: 80, weight: .heavy))
               
            }
            .padding()
           
        }
    }
    
}

struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Montly Style Widget")
        .description("The theme of the widget changes based on month.")
        .supportedFamilies([.systemSmall])
    }
}

struct MonthlyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 12, day: 4), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
    }
    //test to display what ever month on the preview
    static func dateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current, year: 2023, month: month, day: day)
        
        return Calendar.current.date(from: components)!
    }
}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplyFormat: String {
        self.formatted(.dateTime.day())
    }
}
