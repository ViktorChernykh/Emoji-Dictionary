//
//  EmojiListViewController.swift
//  Emoji Dictionary
//
//  Created by Viktor on 12/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

class EmojiListViewController: UITableViewController {
    
    let cellID = "EmojiCell"
    let configurator = TableViewCellConfigurator()
    var emojis = [Emoji]()
    var deleteMode = false
    
    override func viewDidLoad() {
        
        let archiveURL = dataFileURL()
        if let arrayEmojis = emojis.read(from: archiveURL) {
            emojis = arrayEmojis
        } else {
            emojis = Emojis.loadSample()
        }
        navigationItem.title = emojis.title
        navigationItem.leftBarButtonItem = editButtonItem

    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if !editing {
            deleteMode.toggle()
        }
    }
}

// MARK: - Table View Data Source
extension EmojiListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! EmojiCell
        
        configurator.configure(cell, with: emoji)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return deleteMode ? .delete : .insert
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .insert:
            let newEmoji = emojis[indexPath.row]
            emojis.insert(newEmoji, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
}

extension EmojiListViewController {
    // MARK: - Castom method
    func dataFileURL() -> URL {
        let libraryDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
        let url = libraryDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        return url
    }
}

