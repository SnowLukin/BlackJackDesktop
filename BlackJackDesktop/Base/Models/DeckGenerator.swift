//
//  DeckGenerator.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import Foundation


final class DeckGenerator {
    
    func generateDeck() -> [Card] {
        Suit.allCases.reduce([], { $0 + generateCards(for: $1) }).shuffled()
    }
    
    private func generateCards(for suit: Suit) -> [Card] {
        [
            Card(suit: suit, rank: .two),
            Card(suit: suit, rank: .three),
            Card(suit: suit, rank: .four),
            Card(suit: suit, rank: .five),
            Card(suit: suit, rank: .six),
            Card(suit: suit, rank: .seven),
            Card(suit: suit, rank: .eight),
            Card(suit: suit, rank: .nine),
            Card(suit: suit, rank: .ten),
            Card(suit: suit, rank: .jack),
            Card(suit: suit, rank: .queen),
            Card(suit: suit, rank: .king),
            Card(suit: suit, rank: .ace)
        ]
    }
}
