//
//  HandCounter.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import Foundation

final class HandCounter {
    func calculatePoints(for cards: [Card]) -> Int {
        let aces = cards.filter({ $0.rank == .ace })
        let cards = cards.filter({ $0.rank != .ace })
        
        var points = cards.reduce(0) { partialResult, card in
            partialResult + card.rank.value
        }
        
        let aceCombination = Constants.aceCombinations[aces.count] ?? [0]
        let pointsLeft = GameRules.maxPoints - points
        
        for (index, value) in aceCombination.enumerated() {
            if value <= pointsLeft {
                points += value
                break
            } else if index == aceCombination.count - 1 {
                points += value
            }
        }
        return points
    }
}

extension HandCounter {
    private enum Constants {
        static let aceCombinations = [
            0 : [0],
            1 : [11, 1],
            2 : [22, 12, 2],
            3 : [33, 23, 13, 3],
            4 : [44, 34, 24, 14, 4]
        ]
    }
}
