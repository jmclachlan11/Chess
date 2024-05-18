//
//  Testing.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/16/24.
//

import Foundation

extension [[Square]] {
    var description: String {
        return "\(self.map({ "\($0.description)" }).reversed().joined())"
    }
}

extension [Square] {
    var description: String {
        return "\(self.map({ "\($0.description)" }).joined())\n"
    }
}

extension Square: CustomStringConvertible {
    var description: String {
        return "\(self.location.rawValue): \(self.occupant?.description ?? "----"), "
        
        var s = "* \(self.location.rawValue) *\t"
        
        for (index, potentialN) in self.neighbors.enumerated() {
            if let n = potentialN {
                s += " \(Board.neighborDirections[index]): \(n.location.rawValue)"
            }
        }

        return s + "\n"
    }
}

