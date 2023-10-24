//
//  ChevronButton.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct ChevronButton: View {
    
    let isUp: Bool
    let action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: "chevron." + (isUp ? "up" : "down"))
                .font(.title)
                .bold()
                .frame(width: 60, height: 60)
                .background(Colors.buttonBack)
                .foregroundStyle(Colors.label)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ChevronButton(isUp: false) {
        
    }
}
