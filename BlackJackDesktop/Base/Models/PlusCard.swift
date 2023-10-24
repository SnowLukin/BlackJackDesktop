//
//  PlusCard.swift
//  BlackJackDesktop
//
//  Created by Snow Lukin on 20.10.2023.
//

import SwiftUI

struct PlusCard: Identifiable, Hashable {
    var id = UUID()
    
    var image: Image {
        Images.addCard
    }
}
