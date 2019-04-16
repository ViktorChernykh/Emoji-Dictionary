//
//  Emoji+Encoder+Decoder.swift
//  Emoji Dictionary
//
//  Created by Viktor on 16/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import Foundation

extension Emojis {
    func read(from url: URL) -> Emojis? {
        if let data = try? Data(contentsOf: url) {
            if let decodedEmojis = Emojis(from: data) {
                return decodedEmojis
            }
        }
        return nil

    }
    func write(to url: URL) {
        if let encodedEmojis = self.encoded {
            try? encodedEmojis.write(to: url, options: .noFileProtection)
        }
    }
}
