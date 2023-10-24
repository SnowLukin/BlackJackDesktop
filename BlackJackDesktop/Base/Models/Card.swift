//
//  Card.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    var id = UUID()
    let suit: Suit
    let rank: Rank
    var isFlipped = false
    
    var image: Image {
        isFlipped ? Images.cardBack : Images.card(suit: suit, rank: rank).image
    }
}
