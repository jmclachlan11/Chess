//
//  SquareView.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/18/24.
//

import SwiftUI

struct SquareView: View {
    @Binding var square: Square
    
    init(_ square: Binding<Square>) {
        self._square = square
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    square.occupant != nil ? ImagePaint(
                        image: Image("pieces"),
                        sourceRect: CGRect(
                            x: square.occupant!.spriteSheetColumn / 6 + 0.01,
                            y: square.occupant!.spriteSheetRow / 2,
                            width: 1/6,
                            height: 0.5
                        ),
                        scale: 0.27
                    ) : ImagePaint(image: Image("clear"))
                )
                .background(square.isLightSquare ? Colors.lightSquare : Colors.darkSquare)
                .border(.black)
                .frame(width: 40, height: 40)
                .background(.black)
//            Text(verbatim: "\(square.location.rawValue)")
        }
    }
}
