//
//  EmojiWidget.swift
//  EmojiWidget
//
//  Created by yabby on 2021/02/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: getEmojis().randomElement()!)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: getEmojis().randomElement()!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: getEmojis().randomElement()!)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: Emoji
}

struct EmojiWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack{
            Text(entry.emoji.character).font(.system(size: 60)).padding(.top,20)
            Text(entry.emoji.definition)
            Text(String(repeating: "⭐️", count: Int(entry.emoji.rating))).padding(.bottom,20)
        }
    }
}

@main
struct EmojiWidget: Widget {
    let kind: String = "이모지 위젯"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            EmojiWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("이모지 사전")
        .description("매 시간 랜덤한 이모지를 보여줍니다!")
    }
}

struct EmojiWidget_Previews: PreviewProvider {
    static var previews: some View {
        EmojiWidgetEntryView(entry: SimpleEntry(date: Date(), emoji: getEmojis().randomElement()!))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
