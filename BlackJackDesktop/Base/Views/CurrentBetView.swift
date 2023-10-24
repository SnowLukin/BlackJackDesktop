//
//  CurrentBetView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct CurrentBetView: View {
    
    let current: Int
    let total: Int
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Text("\(current)")
                .font(Fonts.largeSemibold)
                .foregroundStyle(Colors.label)
            Text("/ \(total) $")
                .font(Fonts.regular)
                .foregroundStyle(Colors.label)
        }
    }
}

#Preview {
    CurrentBetView(current: 10000, total: 100000)
}
