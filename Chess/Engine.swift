//
//  Engine.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import Foundation

class Engine: BoardMember {
    let board: Board
    var isBlackTurn: Bool
    var moves: [String]
    
    init(board: Board, moves: [String]) {
        self.board = board
        self.isBlackTurn = false
        self.moves = moves
    }
    
    func advance() {
        self.execute(self.moves.removeFirst())
        self.isBlackTurn = !self.isBlackTurn
    }
    
    func execute(_ move: String) {
        var s = move
        s.removeAll(where: { $0 == "+" || $0 == "#" })
        let location = Location(String(move.suffix(2)))
        
        // TODO: make this work for pawns
        let name = String(s.removeFirst())
        
        var candidates: [any Movable] = []
        print(board.members)
        print(board.members.filter({ $0.isBlack == isBlackTurn && $0.abbrevPGN == name }))
        for piece in board.members.filter({ $0.isBlack == isBlackTurn && $0.abbrevPGN == name }) {
            print("calling canReach")
            if piece.canReach(location) {
                candidates.append(piece)
            }
        }
    
        if candidates.count > 1 {
            
            // complicated
            if s.count == 4 {
                candidates = candidates.filter({ $0.square!.location.rawValue == s.prefix(2) })
            } else {
                let c = s.removeFirst()
                candidates = candidates.filter({ $0.square!.location.rawValue.contains(c) })
            }
        }
                
        candidates[0].move(to: location)
    }
}
