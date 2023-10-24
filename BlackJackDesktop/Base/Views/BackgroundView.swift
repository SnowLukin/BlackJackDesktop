//
//  BackgroundView.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Colors.background
            Images.leftBackgroundLogo
                .frame(maxWidth: .infinity, alignment: .leading)
            Images.rightBackgroundLogo
                .colorMultiply(Colors.background)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    BackgroundView()
}
