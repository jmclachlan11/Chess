//
//  Engine.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import Foundation

struct Engine {
    func occupantFor(rank: Rank, file: File) -> Piece {
        return board[Location.element(rank: rank, file: file)]!
    }
    
    mutating func clear(_ location: Location) {
        self.board[location] = Piece.empty
    }
    
    func advance(_ move: String) {
        
    }
    
    init(board: [Location: Piece] = startingBoard) {
        self.board = board
    }
    
    private var board: [Location : Piece]
    
    
}
