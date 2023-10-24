//
//  AppButton.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct AppButton: View {
    
    let text: String
    let action: (() -> Void)?
    
    init(_ text: String, action: (() -> Void)?) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .font(Fonts.button)
                .foregroundStyle(Colors.label)
                .frame(width: 263, height: 65)
                .background(Colors.buttonBack)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AppButton("Start Game") {
        
    }
}
