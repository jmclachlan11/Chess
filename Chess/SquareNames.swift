//
//  SquareNames.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import Foundation

enum Rank: Int {
    case _1 = 0, _2 = 1, _3 = 2, _4 = 3, _5 = 4, _6 = 5, _7 = 6, _8 = 7
}

enum File: Int {
    case a = 0, b = 1, c = 2, d = 3, e = 4, f = 5, g = 6, h = 7
}

enum Location: String, CaseIterable {
    case a1, a2, a3, a4, a5, a6, a7, a8,
         b1, b2, b3, b4, b5, b6, b7, b8,
         c1, c2, c3, c4, c5, c6, c7, c8,
         d1, d2, d3, d4, d5, d6, d7, d8,
         e1, e2, e3, e4, e5, e6, e7, e8,
         f1, f2, f3, f4, f5, f6, f7, f8,
         g1, g2, g3, g4, g5, g6, g7, g8,
         h1, h2, h3, h4, h5, h6, h7, h8
    
    static func element(rank: Rank, file: File) -> Location {
        return self.allCases[file.rawValue * 8 + rank.rawValue]
    }
}

let startingBoard = [
    Location.a1: Piece(color: .white, name: .rook),
    Location.b1: Piece(color: .white, name: .knight),
    Location.c1: Piece(color: .white, name: .bishop),
    Location.d1: Piece(color: .white, name: .queen),
    Location.e1: Piece(color: .white, name: .king),
    Location.f1: Piece(color: .white, name: .bishop),
    Location.g1: Piece(color: .white, name: .knight),
    Location.h1: Piece(color: .white, name: .rook),
    
    Location.a2: Piece(color: .white, name: .pawn),
    Location.b2: Piece(color: .white, name: .pawn),
    Location.c2: Piece(color: .white, name: .pawn),
    Location.d2: Piece(color: .white, name: .pawn),
    Location.e2: Piece(color: .white, name: .pawn),
    Location.f2: Piece(color: .white, name: .pawn),
    Location.g2: Piece(color: .white, name: .pawn),
    Location.h2: Piece(color: .white, name: .pawn),
    
    Location.a3: Piece.empty, Location.a4: Piece.empty, Location.a5: Piece.empty, Location.a6: Piece.empty,
    Location.b3: Piece.empty, Location.b4: Piece.empty, Location.b5: Piece.empty, Location.b6: Piece.empty,
    Location.c3: Piece.empty, Location.c4: Piece.empty, Location.c5: Piece.empty, Location.c6: Piece.empty,
    Location.d3: Piece.empty, Location.d4: Piece.empty, Location.d5: Piece.empty, Location.d6: Piece.empty,
    Location.e3: Piece.empty, Location.e4: Piece.empty, Location.e5: Piece.empty, Location.e6: Piece.empty,
    Location.f3: Piece.empty, Location.f4: Piece.empty, Location.f5: Piece.empty, Location.f6: Piece.empty,
    Location.g3: Piece.empty, Location.g4: Piece.empty, Location.g5: Piece.empty, Location.g6: Piece.empty,
    Location.h3: Piece.empty, Location.h4: Piece.empty, Location.h5: Piece.empty, Location.h6: Piece.empty,
    
    Location.a7: Piece(color: .black, name: .pawn),
    Location.b7: Piece(color: .black, name: .pawn),
    Location.c7: Piece(color: .black, name: .pawn),
    Location.d7: Piece(color: .black, name: .pawn),
    Location.e7: Piece(color: .black, name: .pawn),
    Location.f7: Piece(color: .black, name: .pawn),
    Location.g7: Piece(color: .black, name: .pawn),
    Location.h7: Piece(color: .black, name: .pawn),
    
    Location.a8: Piece(color: .black, name: .rook),
    Location.b8: Piece(color: .black, name: .knight),
    Location.c8: Piece(color: .black, name: .bishop),
    Location.d8: Piece(color: .black, name: .queen),
    Location.e8: Piece(color: .black, name: .king),
    Location.f8: Piece(color: .black, name: .bishop),
    Location.g8: Piece(color: .black, name: .knight),
    Location.h8: Piece(color: .black, name: .rook),
]
