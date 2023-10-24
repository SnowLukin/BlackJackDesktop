//
//  Rank.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import Foundation

enum Rank: String {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    case ace = "A"
    
    var value: Int {
        switch self {
        case .two:
            2
        case .three:
            3
        case .four:
            4
        case .five:
            5
        case .six:
            6
        case .seven:
            7
        case .eight:
            8
        case .nine:
            9
        case .ten, .jack, .queen, .king:
            10
        case .ace:
            0
        }
    }
}
