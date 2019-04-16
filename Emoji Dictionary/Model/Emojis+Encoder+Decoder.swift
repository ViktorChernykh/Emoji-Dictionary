//
//  Emojis+Encoder+Decode.swift
//  Emoji Dictionary
//
//  Created by Viktor on 16/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import Foundation

extension Emojis {
    var encoded: Data? {
        let encoder = PropertyListEncoder()
   
        return try? encoder.encode(self)
    }
    
    init?(from data: Data) {
        let decoder = PropertyListDecoder()
        
        guard let decodedEmojis = try? decoder.decode(Emojis.self, from: data) else { return nil }
        self = decodedEmojis
    }

}
