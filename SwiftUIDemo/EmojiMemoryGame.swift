//
//  EmojiMemoryGame.swift
//  SwiftUIDemo
//
//  Created by Александр Хаверев on 27.08.2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐽", "🐵", "🙈", "🙉", "🙊", "🐒", "🐔", "🐧", "🐦"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
