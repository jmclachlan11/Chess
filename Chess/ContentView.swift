//
//  ContentView.swift
//  Chess
//
//  Created by Jacob McLachlan on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        self.engine = Engine()
    }
    
    private let engine: Engine
        
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.fixed(40), spacing: 0), count: 8)
        
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(0 ..< 64) { i in
                Square(indexFromTopLeft: i, engine: engine)
            }
        }
    }
}

#Preview {
    ContentView()
}
