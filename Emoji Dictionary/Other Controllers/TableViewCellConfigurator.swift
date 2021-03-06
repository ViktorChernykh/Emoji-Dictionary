//
//  TableViewCellConfigurator.swift
//  Emoji Dictionary
//
//  Created by Viktor on 12/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

class TableViewCellConfigurator {
    func configure(_ cell: EmojiCell, with emoji: Emoji) {
        cell.emojiSymbolLabel.text = emoji.symbol
        cell.emojiNameLabel.text = emoji.name
        cell.emojiDescriptionLabel.text = emoji.description
        cell.showsReorderControl = true
    }
}
