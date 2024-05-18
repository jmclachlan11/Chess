//
//  Square.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import SwiftUI

class Square {
    let location: Location
    let isLightSquare: Bool
    let isPromotionSquare: (white: Bool, black: Bool)
    
    var neighbors: [Square?]
    var occupant: (any Movable)?
        
    init(_ location: Location, isLightSquare: Bool) {
        self.location = location //Location(rank: self.rank, file: self.file)
        self.neighbors = []
        self.isLightSquare = isLightSquare
    
        if location.rawValue.contains("1") {
            self.isPromotionSquare = (white: false, black: true)
        } else if location.rawValue.contains("8") {
            self.isPromotionSquare = (white: true, black: false)
        } else {
            self.isPromotionSquare = (white: false, black: false)
        }
    }

    func update(_ square: Binding<Square>) {
        square.wrappedValue = self
    }
}
