//
//  BankView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI


struct BankView: View {
    
    let text: String
    let amount: Int
    
    init(_ text: String, amount: Int) {
        self.text = text + ":"
        self.amount = amount
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Text(text)
                .font(Fonts.smallLight)
                .frame(width: 65)
            Text("\(amount) $")
                .font(Fonts.gaintSemibold)
                .multilineTextAlignment(.leading)
        }
        .foregroundStyle(Colors.label)
        .frame(height: 291)
    }
}

#Preview {
    BankView("Total", amount: 100000)
}
