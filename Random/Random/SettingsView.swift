//
//  SettingsView.swift
//  Random
//
//  Created by Yavuz Kaan Akyüz on 25.11.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var maximumValue: Int
    @Binding var minimumValue: Int
    
    var body: some View {
        List {
            Section {
                Picker(selection: $maximumValue, label: Text("Maximum Value").foregroundColor(.blue).font(.headline)) {
                    ForEach(0..<1000 + 1) {
                            Text("\($0)")
                        }
                }
            }
            Section {
                Picker(selection: $minimumValue, label: Text("Minimum Value").foregroundColor(.red).font(.headline)) {
                    ForEach(0..<1000 + 1) {
                        Text("\($0)")
                    }
                }
            }
            
            
        }
        
        
    }
}


