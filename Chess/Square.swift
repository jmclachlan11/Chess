//
//  Square.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import SwiftUI

struct Square: View {
    init(indexFromTopLeft: Int, engine: Engine) {
        self.file = File(rawValue: indexFromTopLeft % 8)!
        self.rank = Rank(rawValue: (63 - indexFromTopLeft) / 8)!
        
        self.isLightSquare = self.rank.rawValue % 2 == 0 ? indexFromTopLeft % 2 != 0 : indexFromTopLeft % 2 == 0
        
        self.occupant = engine.occupantFor(rank: self.rank, file: self.file)
    }
    
    private let rank: Rank
    private let file: File
    private let isLightSquare: Bool
    
    private var occupant: Piece
    
    let columns = 6
    let rows = 2
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    occupant.isOccupied ? ImagePaint(
                        image: Image("pieces"),
                        sourceRect: CGRect(
                            x: occupant.spriteSheetColumn() / 6 + 0.01,
                            y: occupant.spriteSheetRow() / 2,
                            width: 1/6,
                            height: 0.5
                        ),
                        scale: 0.27
                    ) : ImagePaint(image: Image("clear"))
                )
                .background(isLightSquare ? Colors.lightSquare : Colors.darkSquare)
                .border(.black)
                .frame(width: 40, height: 40)
                .background(.black)
        }
    }
}
