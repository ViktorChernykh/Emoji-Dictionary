//
//  EmojiList+Navigation.swift
//  Emoji Dictionary
//
//  Created by Viktor on 16/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//
import UIKit

// MARK: - Navigation
extension EmojiListViewController {
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveSegue" else { return }
        guard let controller = segue.source as? EmojiDetailViewController else { return }
        guard let emoji = controller.emoji else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            emojis[indexPath.row] = emoji
            tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
        } else {
            let indexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        let url = dataFileURL()
        emojis.write(to: url)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EmojiEditeSegue" else { return }
        guard let controller = segue.destination as? EmojiDetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        controller.emoji = emojis[indexPath.row]
        controller.title = "Edite"
    }
}
