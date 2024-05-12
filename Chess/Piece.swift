//
//  Piece.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import Foundation

struct Piece {
    enum Name { case king, queen, rook, bishop, knight, pawn }
    enum Color { case black, white }
    
    static let empty = Piece()
    
    private init() {
        self.isOccupied = false
        self.name = .king
        self.color = .white
    }
    
    init(color: Piece.Color, name: Piece.Name) {
        self.isOccupied = true
        self.name = name
        self.color = color
    }
    
    let isOccupied: Bool
    let name: Piece.Name
    let color: Piece.Color
    
    func spriteSheetRow() -> Double {
        return self.color == .white ? 0 : 1
    }
    
    func spriteSheetColumn() -> Double {
        switch name {
        case .king:
            return 0
        case .queen:
            return 1
        case .rook:
            return 4
        case .bishop:
            return 2
        case .knight:
            return 3
        case .pawn:
            return 5
        }
   
    }
}

