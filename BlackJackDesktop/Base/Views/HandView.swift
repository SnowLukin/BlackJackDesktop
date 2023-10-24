//
//  HandView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct HandView: View {
    
    let cards: [Card]
    let flipFirst: Bool
    
    init(_ cards: [Card], flipFirst: Bool = false) {
        self.cards = cards
        self.flipFirst = flipFirst
    }
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(transformedCards) { card in
                CardView(card: card)
            }
        }
    }
}

#Preview {
    HandView([
        Card(suit: .clubs, rank: .ace),
        Card(suit: .clubs, rank: .ace),
        Card(suit: .clubs, rank: .ace)
    ], flipFirst: true)
}

extension HandView {
    var transformedCards: [Card] {
        var cards = self.cards
        let firstCard = cards.removeFirst()
        let flippedCard = Card(
            id: firstCard.id,
            suit: firstCard.suit,
            rank: firstCard.rank,
            isFlipped: flipFirst
        )
        cards.insert(flippedCard, at: 0)
        return cards
    }
}
