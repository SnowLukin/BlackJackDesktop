//
//  AddCardButton.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct AddCardButton: View {
    
    let action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Images.addCard
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AddCardButton {
        
    }
}
