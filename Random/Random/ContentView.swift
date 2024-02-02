//
//  ContentView.swift
//  Random
//
//  Created by Yavuz Kaan Akyüz on 25.11.2023.
//

import SwiftUI


import SwiftUI

struct ContentView: View {
    
    @State private var maximumValue = 100
    @State private var minimumValue = 0
    
    
    var body: some View {
        
        RandomView()
    }
}


#Preview {
    ContentView()
}
