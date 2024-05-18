//
//  Board.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/16/24.
//

import Foundation

class Board {
    private var board: [[Square]]
    var members: [any Movable]
    
    static let neighborDirections = ["SW", "S", "SE", "W", "E", "NW", "N", "NE"]
    
    init() {
        self.board = []
        self.members = []
    }
    
    init(_ board: [[Square]]) {
        self.board = board
        self.members = []
    }
    
    func register(_ pieces: [any Movable]) {
        for piece in pieces {
            self.register(piece)
        }
    }
    
    func register(_ piece: any Movable) {
        self.members.append(piece)
    }
    
    func report(from oldL: Location, to newL: Location) {
        let (oldR, oldF) = oldL.decompose()
        let (newR, newF) = newL.decompose()
        
        self.board[newR.rawValue][newF.rawValue].occupant = self.board[oldR.rawValue][oldF.rawValue].occupant
        self.board[oldR.rawValue][oldF.rawValue].occupant = nil
    }
    
    func square(at location: Location) -> Square {
        let (rank, file) = location.decompose()
        return self.board[rank.rawValue][file.rawValue]
    }
    
    func search(with piece: any Movable, for location: Location) -> Bool {
        for direction in piece.mobility.enumerated().filter({ $0.element }).map({ $0.offset }) {
            print(direction)
            if search(in: direction, with: piece, for: location) {
                return true
            }
        }
        return false
    }
    
    private func search(in direction: Int, with piece: any Movable, for location: Location) -> Bool {
        var currentSquare = piece.square!
        
        while true {
            
            print("at \(currentSquare.location.rawValue), looking \(Board.neighborDirections[direction]), next is \(currentSquare.neighbors[direction]?.location.rawValue ?? "nil")")
            
            // arrived at target
            if currentSquare.location == location {
                return true
            }
            
            // at edge of board
            guard let next = currentSquare.neighbors[direction] else {
                return false
            }
                        
            if let occupant = next.occupant {
                                
                // blocked by own piece
                if occupant.isFriendOf(piece) {
                    return false
                }
                
                // enemy piece
                return next.location == location
            }
            
            // otherwise: square is empty, keep searching
            currentSquare = next
        }
    }
    
    static func create() -> [[Square]] {
        var board: [[Square]] = []

        let files = "abcdefgh"
        let ranks = "12345678"

        var isLightSquare = false
        for i in 0 ..< 8 {
            var rank: [Square] = []
            for j in 0 ..< 8 {
                rank.append(Square(Location("\(files[j])\(ranks[i])"), isLightSquare: isLightSquare))
                isLightSquare = !isLightSquare
            }
            board.append(rank)
            isLightSquare = !isLightSquare
        }

        // bottom left
        board[0][0].neighbors = [nil, nil, nil, nil, board[0][1], nil, board[1][0], board[1][1]]

        // bottom right
        board[0][7].neighbors = [nil, nil, nil, board[0][6], nil, board[1][6], board[1][7], nil]

        // top left
        board[7][0].neighbors = [nil, board[6][0], board[6][1], nil, board[7][1], nil, nil, nil]

        // top right
        board[7][7].neighbors = [board[6][6], board[6][7], nil, board[7][6], nil, nil, nil, nil]

        for i in 1 ..< 7 {
            // 1st rank
            board[0][i].neighbors = [nil, nil, nil, board[0][i - 1], board[0][i + 1], board[1][i - 1], board[1][i], board[1][i + 1]]

            // 8th rank
            board[7][i].neighbors = [board[6][i - 1], board[6][i], board[6][i + 1], board[7][i - 1], board[7][i + 1], nil, nil, nil]
            
            // a file
            board[i][0].neighbors = [nil, board[i - 1][0], board[i - 1][1], nil, board[i][1], nil, board[i + 1][0], board[i + 1][1]]
            
            // h file
            board[i][7].neighbors = [board[i - 1][6], board[i - 1][7], nil, board[i][6], nil, board[i + 1][6], board[i + 1][7], nil]
            
            // inside
            for j in 1 ..< 7 {
                board[j][i].neighbors = [board[j - 1][i - 1], board[j - 1][i], board[j - 1][i + 1], board[j][i - 1], board[j][i + 1], board[j + 1][i - 1], board[j + 1][i], board[j + 1][i + 1]]
            }
        }

        return board
    }
    
    var description: String {
        return board.description
    }
}
