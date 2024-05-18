//
//  PGN.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import Foundation

struct PGN {
    let moves: [String]
    let opening: String
    let result: String
    
    private static let endConditions = ["1-0", "0-1", "1/2-1/2"]
    
    init(fileName: String) {
        var s = ""
        do {
            let path = Bundle.main.path(forResource: fileName, ofType: "pgn")
            s = try String(contentsOfFile: path!, encoding: .utf8)
        }
        catch {
            fatalError("invalid file path")
        }
                
        let opening = s[s.index(s.firstRange(of: "Opening ")!.upperBound, offsetBy: 1) ..< s.endIndex]
        self.opening = String(opening[opening.startIndex ..< opening.index(opening.firstIndex(of: "]")!, offsetBy: -1)])
                
        var moves: [String] = []
        s = String(s[s.firstRange(of: "1. ")!.lowerBound ..< s.endIndex])
        
        while !PGN.endConditions.contains(where: s.hasPrefix) {
            s = String(s[s.index(s.firstRange(of: ".")!.lowerBound, offsetBy: 2) ..< s.endIndex])
        
            let whiteMove = s.prefix(through: s.index(s.firstIndex(of: " ")!, offsetBy: -1))

            s.trimPrefix(whiteMove)
            s.trimPrefix(" ")
            
            moves.append(String(whiteMove))
            
            if s.first == "1" || s.first == "0" {
                break
            }
            
            let blackMove = s.prefix(through: s.index(s.firstIndex(of: " ")!, offsetBy: -1))
            s.trimPrefix(blackMove)
            
            moves.append(String(blackMove))
            
            s.trimPrefix(" ")
        }
        
        self.moves = moves
        
        if (!PGN.endConditions.contains { s in
            s.contains(#"\s"#)
        }) {
            s = String(s.dropLast())
        }
        self.result = s
    }
}
