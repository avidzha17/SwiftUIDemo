//
//  EmogiMemoryGameView.swift
//  SwiftUIDemo
//
//  Created by Александр Хаверев on 27.08.2021.
//

import SwiftUI

struct EmogiMemoryGameView: View {
  
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(viewModel.cards) { card in
            CardView(card)
              .aspectRatio(2/3, contentMode: .fit)
              .onTapGesture {
                viewModel.choose(card)
              }
          }
        }
      }
      .foregroundColor(.red)
    }
    .padding(.horizontal)
  }
}

struct CardView: View {
  let card: EmojiMemoryGame.Card
  
  init(_ card:  EmojiMemoryGame.Card) {
    self.card = card
  }
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if card.isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else if card.isMatched {
        shape.opacity(0 )
      } else {
        shape.fill()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    EmogiMemoryGameView(viewModel: game)
  }
}
