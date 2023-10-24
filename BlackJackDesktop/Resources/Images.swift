//
//  Images.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

enum Images {
    
    case card(suit: Suit, rank: Rank)
    
    static let leftBackgroundLogo = Image(.leftBackgroundLogo)
    static let rightBackgroundLogo = Image(.rightBackgroundLogo)
    static let addCard = Image(.addCard)
    static let cardBack = Image(.cardBack)
    
    var image: Image {
        switch self {
        case .card(let suit, let rank):
            Image(rank.rawValue + suit.rawValue)
        }
    }
}
