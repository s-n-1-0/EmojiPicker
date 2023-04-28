//
//  DefaultEmojiProvider.swift
//  
//
//  Created by Kévin Sibué on 11/01/2023.
//

import Foundation
import Smile

public final class DefaultEmojiProvider: EmojiProvider {

    public init() { }

    public func getAll() -> [Emoji] {
        return Smile.list().compactMap({
            let n = name(emoji: $0)
            if $0.description.unicodeScalars.first?.properties.isEmoji ?? false{
                return Emoji(value: $0, name: n.first!)
            }
            return nil
        })
    }

}
