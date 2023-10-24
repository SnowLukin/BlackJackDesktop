//
//  CardView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var body: some View {
        card.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
    }
}

#Preview {
    CardView(card: Card(suit: .clubs, rank: .eight))
}
