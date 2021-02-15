//
//  Emoji.swift
//  Emojy Dictionary
//
//  Created by yabby on 2021/02/14.
//

import Foundation

struct Emoji {
    var character = ""
    var definition = ""
    var year = 0
    var rating = 0.0
    var category = ""
    
}

let emojis = ["🥲", "🥺", "😎", "🏎", "⛪️", "📕"]

//앞서 선언한 Emoji를 Type처럼 쓸 수 있음
func getEmojis() -> [Emoji] {
    let emoji1 = Emoji(character: "🥲", definition: getEmojiDefinition(Emoji: "🥲"), year: 2021, rating: 4.8, category: "Smiley")
    let emoji2 = Emoji(character: "🥺", definition: getEmojiDefinition(Emoji: "🥺"), year: 2020, rating: 4.7, category: "Smiley")
    let emoji3 = Emoji(character: "😎", definition: getEmojiDefinition(Emoji: "😎"), year: 2019, rating: 4.0, category: "Smiley")
    let emoji4 = Emoji(character: "🏎", definition: getEmojiDefinition(Emoji: "🏎"), year: 2018, rating: 2.2, category: "Vehicle")
    let emoji5 = Emoji(character: "⛪️", definition: getEmojiDefinition(Emoji: "⛪️"), year: 2017, rating: 2.1, category: "Building")
    let emoji6 = Emoji(character: "📕", definition: getEmojiDefinition(Emoji: "📕"), year: 2016, rating: 3.5, category: "Object")
    
    return [emoji1, emoji2, emoji3, emoji4, emoji5, emoji6]
}

func getEmojiDefinition(Emoji: String) -> String {
    return Emoji.unicodeScalars.first!.properties.name!.capitalized
}
