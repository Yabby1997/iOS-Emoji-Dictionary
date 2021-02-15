//
//  EmojiDefinitionViewController.swift
//  Emojy Dictionary
//
//  Created by yabby on 2021/02/13.
//

import UIKit

class EmojiDefinitionViewController: UIViewController {

    // weak는 메모리관리와 관련된것.  
    @IBOutlet weak var blownUpEmojiLabel: UILabel!
    @IBOutlet weak var emojiDefinitionLabel: UILabel!
    
    var emoji = Emoji()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blownUpEmojiLabel.text = emoji.character
        emojiDefinitionLabel.text = "Emoji \(emoji.character)는 \"\(emoji.definition)\"입니다. \(emoji.year)년에 만들어졌으며, 카테고리는 \(emoji.category)에 속합니다.\n 평점 : \(emoji.rating)"
    }
}
