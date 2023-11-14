//
//  GameViewModel.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 24.10.2023.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var money = 100_000
    @Published var bet = 100
    
    @Published var playerCards = [Card]()
    @Published var dealerCards = [Card]()
    @Published var playerScore = 0
    @Published var dealerScore = 0
    
    @Published var isDealersTurn = false
    
    @Published var gameState = GameState.starting
    
    @Published var gameStatus = GameStatus.inGame {
        didSet {
            if gameStatus != .inGame {
                handleBet()
            }
        }
    }
    
    private let handCounter = HandCounter()
    private let deckGenerator = DeckGenerator()
    private var deck = [Card]()
    
    init() {
        restart()
    }
    
    func restart() {
        deck = deckGenerator.generateDeck()
        playerCards = []
        playerScore = 0
        dealerCards = []
        dealerScore = 0
        bet = 0
        
        gameState = .starting
        isDealersTurn = false
        
        for _ in 1...2 {
            playerTakes()
            dealerTakes(shouldCheck: false)
        }
        
        if playerScore == 21 {
            isDealersTurn = true
            gameStatus = dealerScore == 21 ? .draw : .blackJack
            gameState = .endgame
        }
    }
    
    func startDealersTurn() {
        isDealersTurn = true

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if self.dealerScore < self.playerScore, self.dealerScore < 21, self.gameState != .endgame {
                withAnimation(.easeInOut) {
                    self.dealerTakes()
                }
            } else {
                timer.invalidate()
                withAnimation {
                    self.gameState = .endgame
                }
            }
        }
    }
}

extension GameViewModel {
    func playerTakes() {
        let card = deck.removeLast()
        playerCards.append(card)
        playerScore = handCounter.calculatePoints(for: playerCards)
        checkPlayer()
    }
    
    func dealerTakes(shouldCheck: Bool = true) {
        let card = deck.removeLast()
        dealerCards.append(card)
        dealerScore = handCounter.calculatePoints(for: dealerCards)
        if shouldCheck {
            checkDealer()
        }
    }
    
    func increaseBet() {
        money -= 100
        bet += 100
    }
    
    func decreaseBet() {
        if bet >= 100 {
            money += 100
            bet -= 100
        }
    }
    
    private func checkPlayer() {
        if playerScore > 21 {
            gameStatus = .busted
            gameState = .endgame
        }
    }
    
    private func checkDealer() {
        if dealerScore == playerScore {
            gameStatus = .draw
            gameState = .endgame
        } else if dealerScore > 21 {
            gameStatus = .victory
            gameState = .endgame
        } else if dealerScore > playerScore {
            gameStatus = .lost
            gameState = .endgame
        }
    }
    
    private func handleBet() {
        switch gameStatus {
        case .blackJack, .victory:
            money += bet * GameRules.victoryMultiplier
        case .draw:
            money += bet
        case .busted, .lost, .inGame:
            break
        }
        bet = 0
    }
}
