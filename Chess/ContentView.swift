//
//  ContentView.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        let pgn = PGN(fileName: "game")
        
        print(pgn.moves)
        print("->\(pgn.opening)<-")
        print("->\(pgn.result)<-")
        
        self.board = Board(Board.create())
        self.engine = Engine(board: board, moves: pgn.moves)
        
        board.register([
            Rook(on: board, at: .a1, isBlack: false),
            Rook(on: board, at: .a8, isBlack: true),
            Rook(on: board, at: .h1, isBlack: false),
            Rook(on: board, at: .h8, isBlack: true),
            Bishop(on: board, at: .c1, isBlack: false),
            Bishop(on: board, at: .f1, isBlack: false),
            Bishop(on: board, at: .c8, isBlack: true),
            Bishop(on: board, at: .f8, isBlack: true),
        ])
    }
    
    private var engine: Engine
    private var board: Board
    
    private let viewAsBlack = false
    
    @State var squares = Array(repeating: Square(.a1, isLightSquare: false), count: 64)
        
    var body: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.fixed(40), spacing: 0), count: 8),
            spacing: 0
        ) {
            ForEach(0 ..< 64) { index in
                let i = viewAsBlack ? index : 63 - index
                let boardSquare = board.square(at: Location(
                    rank: Rank(rawValue: i / 8)!,
                    file: File(rawValue: 7 - (i % 8))!
                ))
                let squareView = SquareView($squares[i])
                
                squareView
                .onAppear(perform: {
                    boardSquare.update(squareView.$square)
                })
            }
        }
        Button(action: {
            let src = Location.f1
            let dest = Location.e2
            board.report(from: src, to: dest)
            
            let srcView = SquareView($squares[src.toIndex()])
            board.square(at: src).update(srcView.$square)
            
            let destView = SquareView($squares[dest.toIndex()])
            board.square(at: dest).update(destView.$square)
            
        }, label: {
            return Label("Next", systemImage: "arrowshape.forward.fill")
        })
        .padding(10)
    }
}

#Preview {
    ContentView()
}
