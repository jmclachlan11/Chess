//
//  Utility.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/13/24.
//

import Foundation

extension String {
    subscript(_ i: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: i)])
    }
}
