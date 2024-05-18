//
//  Bishop.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/16/24.
//

import Foundation

class Bishop: Piece, Movable {
    let mobility = [true, false, true, false, false, true, false, true]
    let abbrevPGN = "B"
    let description = "Bishop"
    let spriteSheetColumn = 2.0
        
    override init(on board: Board, at location: Location, isBlack: Bool) {
        super.init(on: board, at: location, isBlack: isBlack)
        
        self.square!.occupant = self
        self.board.register(self)
    }
    
    func canReach(_ location: Location) -> Bool {
        return self.board.search(with: self, for: location)
    }
}
