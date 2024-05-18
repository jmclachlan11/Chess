//
//  Piece.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import Foundation

class Piece: BoardMember, ObservableObject {
    var square: Square?
    let board: Board
    let isBlack: Bool
    let spriteSheetRow: Double
    
    init() {
        self.isBlack = false
        self.board = Board()
        self.square = nil
        self.spriteSheetRow = 0
    }
    
    init(on board: Board, at location: Location, isBlack: Bool) {
        self.isBlack = isBlack
        self.board = board
        self.square = board.square(at: location)
        self.spriteSheetRow = isBlack ? 1 : 0
    }
    
    func isFriendOf(_ m: any Movable) -> Bool {
        return self.isBlack == m.isBlack
    }
    
    func move(to l: Location) {
        board.report(from: self.square!.location, to: l)
        self.square = board.square(at: l)
    }
}


