//
//  GameScoreView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct GameScoreView: View {
    
    let name: String
    let score: String
    
    init(_ name: String, score: Int, showScore: Bool = true) {
        self.name = name
        self.score = showScore ? "\(score)" : "?"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 81) {
            Text(name)
                .font(Fonts.largeBold)
            HStack(alignment: .lastTextBaseline) {
                Text("Score:")
                    .font(Fonts.smallLight)
                Text(score)
                    .font(Fonts.gaintSemibold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .foregroundStyle(Colors.label)
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    GameScoreView("Dealer", score: 21)
        .frame(width: 180)
}
