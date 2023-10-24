//
//  GameStatus.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 24.10.2023.
//

import Foundation

enum GameStatus {
    case inGame
    case busted
    case lost
    case victory
    case draw
    case blackJack
    
    var message: String {
        switch self {
        case .inGame:
            ""
        case .busted:
            "Busted..."
        case .lost:
            "You Lost"
        case .victory:
            "You WON!"
        case .draw:
            "Draw"
        case .blackJack:
            "BLACK JACK!!!"
        }
    }
}
