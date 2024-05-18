//
//  Rook.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/16/24.
//

import Foundation

class Rook: Piece, Movable {
    let mobility = [false, true, false, true, true, false, true, false]
    let abbrevPGN = "R"
    let description = "Rook"
    let spriteSheetColumn = 4.0
    
    override init(on board: Board, at location: Location, isBlack: Bool) {
        super.init(on: board, at: location, isBlack: isBlack)
        
        self.square!.occupant = self
        self.board.register(self)
    }
    
    func canReach(_ location: Location) -> Bool {
        return board.search(with: self, for: location)
    }
    
}
