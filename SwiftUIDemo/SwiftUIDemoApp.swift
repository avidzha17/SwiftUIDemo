//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Александр Хаверев on 27.08.2021.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmogiMemoryGameView(viewModel: game)
        }
    }
}
