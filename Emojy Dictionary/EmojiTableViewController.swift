//
//  EmojiTableViewController.swift
//  Emoji Dictionary
//
//  Created by yabby on 2021/02/12.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    let emojis = getEmojis()
    
    // 초기 마운트시 수행됨.
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 얼마나 많은 행이 있는지? <- 테이블의 크기는 어떻게 할건지? 왜 굳이 함수로 처리하는지는 모르겠다. 변수로 해도 되지 않나?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }

    // 각 행에 뭐가 들어가는지? <- 테이블뷰에서 각 셀을 만들어 반환해주는 함수인데, 인자로 알아서 몇번째 인덱스에 해당하는건지도 주어진다.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = emojis[indexPath.row].character + " " + emojis[indexPath.row].category

        return cell
    }
    
    //didselect
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedEmoji = emojis[indexPath.row]
        performSegue(withIdentifier: "Definition", sender: selectedEmoji)
    }
    
    //prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 여기서 as! 를 통해 destination을 EmojiDefinitionViewController로 unwrap했기에 다른 VC가오면 문제가될 수 있음.
        if let definitionVC = segue.destination as? EmojiDefinitionViewController {
            if let selectedEmoji = sender as? Emoji {
                definitionVC.emoji = selectedEmoji
            }
        }
    }
}
