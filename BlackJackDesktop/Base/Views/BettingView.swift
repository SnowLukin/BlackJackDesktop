//
//  BettingView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct BettingView: View {
    
    let total: Int
    let bet: Int
    
    let onDecrease: (() -> Void)?
    let onIncrease: (() -> Void)?
    
    var body: some View {
        VStack {
            CurrentBetView(current: bet, total: total)
            HStack(spacing: 43) {
                HStack(spacing: 12) {
                    Text("- 100 $")
                        .font(Fonts.regular)
                        .foregroundStyle(Colors.secondary)
                    ChevronButton(isUp: false) {
                        onDecrease?()
                    }
                }
                
                HStack(spacing: 12) {
                    ChevronButton(isUp: true) {
                        onIncrease?()
                    }
                    Text("+ 100 $")
                        .font(Fonts.regular)
                        .foregroundStyle(Colors.secondary)
                }
            }
        }
    }
}

#Preview {
    BettingView(total: 100_000, bet: 1_000) {
        
    } onIncrease: {
        
    }
}
