//
//  Protocols.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/16/24.
//

import Foundation

protocol BoardMember {
    var board: Board { get }
}

protocol Movable: ObservableObject {
    var mobility: [Bool] { get }
    var abbrevPGN: String { get }
    var square: Square? { get set }
    var isBlack: Bool { get }
    
    var description: String { get }
    
    var spriteSheetRow: Double { get }
    var spriteSheetColumn: Double { get }
    
    func canReach(_ l: Location) -> Bool
    func isFriendOf(_ m: any Movable) -> Bool
    func move(to l: Location)
}

