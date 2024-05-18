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
    
    init(_ s: String) {
        switch s {
            case "a": self = .a
            case "b": self = .b
            case "c": self = .c
            case "d": self = .d
            case "e": self = .e
            case "f": self = .f
            case "g": self = .g
            default: self = .h
        }
    }
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
    
    func decompose() -> (rank: Rank, file: File) {
        return (
            rank: Rank(rawValue: Int(self.rawValue[1])! - 1)!,
            file: File(self.rawValue[0])
        )
    }
    
    func toIndex() -> Int {
        let (rank, file) = self.decompose()
        return rank.rawValue * 8 + 7 - (file.rawValue % 8)
    }
    
    init(_ s: String) {
        self.init(rawValue: s)!
    }
    
    init(rank: Rank, file: File) {
        self = Location.allCases[file.rawValue * 8 + rank.rawValue]
    }
}

