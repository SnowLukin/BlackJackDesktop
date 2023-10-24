//
//  MordaView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct MordaView: View {
    
    @StateObject private var viewModel = MordaViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if viewModel.mordaState == .endgame {
                endGameMessage
            }
            
            HStack {
                VStack(alignment: .leading) {
                    BankView("Total", amount: viewModel.money)
                    BankView("Bet", amount: viewModel.bet)
                }.frame(width: 291)
                
                Divider()
                    .frame(width: 1, height: 575)
                    .foregroundStyle(Colors.secondary)
                    .background(Colors.secondary)
                    .padding()
                
                switch viewModel.mordaState {
                case .starting, .playing, .endgame:
                    playingContent
                case .betting:
                    bettingContent
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            buttons
        }
        .frame(minWidth: 1440, minHeight: 1024)
    }
}

#Preview {
    MordaView()
}

extension MordaView {
    private var playingContent: some View {
        Group {
            VStack(spacing: 140) {
                GameScoreView("Dealer", score: viewModel.dealerScore, showScore: viewModel.isDealersTurn)
                GameScoreView("Player", score: viewModel.playerScore)
            }.frame(width: 170)
                .padding(.trailing, 64)
            
            VStack(alignment: .leading, spacing: 130) {
                HandView(viewModel.dealerCards, flipFirst: !viewModel.isDealersTurn)
                HandView(viewModel.playerCards)
            }
        }
    }
    
    private var bettingContent: some View {
        BettingView(
            total: viewModel.money,
            bet: viewModel.bet,
            onDecrease: viewModel.decreaseBet,
            onIncrease: viewModel.increaseBet
        )
    }
    
    private var endGameMessage: some View {
        Text(viewModel.gameStatus.message)
            .font(Fonts.largeSemibold)
            .foregroundStyle(Colors.label)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(80)
    }
    
    private var buttons: some View {
        HStack(spacing: 37) {
            switch viewModel.mordaState {
            case .starting:
                AppButton("Start Game") {
                    withAnimation {
                        viewModel.mordaState = .playing
                    }
                }
                
                AppButton("Place Bet") {
                    withAnimation {
                        viewModel.mordaState = .betting
                    }
                }
            case .betting:
                AppButton("Done") {
                    withAnimation {
                        viewModel.mordaState = .starting
                    }
                }
            case .playing:
                AppButton("Hit") {
                    withAnimation {
                        viewModel.playerTakes()
                    }
                }.disabled(viewModel.isDealersTurn)
                
                AppButton("Stand") {
                    viewModel.startDealersTurn()
                }.disabled(viewModel.isDealersTurn)
            case .endgame:
                AppButton("New Game") {
                    withAnimation {
                        viewModel.restart()
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding(70)
    }
}
