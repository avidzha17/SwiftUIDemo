//
//  MemoryGame.swift
//  SwiftUIDemo
//
//  Created by Александр Хаверев on 27.08.2021.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
  private(set) var cards: Array<Card>
  
  private var indexOfFaceUpCard: Int? {
    get { return cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
    set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
  }
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
       !cards[chosenIndex].isFaceUp,
       !cards[chosenIndex].isMatched {
      
      if let potentialMatchIndex = indexOfFaceUpCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
        }
        cards[chosenIndex].isFaceUp = true
      } else {
        indexOfFaceUpCard = chosenIndex
      }
    }
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(id: pairIndex * 2, content: content))
      cards.append(Card(id: pairIndex * 2 + 1, content: content))
    }
    cards.shuffle()
  }
  
  struct Card: Identifiable  {
    let id: Int
    let content: CardContent
    var isFaceUp: Bool = false
    var isMatched: Bool = false
  }
}

extension Array {
  var oneAndOnly: Element? {
    if count == 1 {
      return first
    } else {
      return nil
    }
  }
}
