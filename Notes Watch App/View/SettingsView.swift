//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Batuhan Kabaktepe on 20.09.24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    var body: some View {
        VStack(spacing: 8){
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(
                value: Binding(get: {
                    self.value
                }, set: { newValue in
                    self.value = newValue
                    update()
                }),
                in: 1...4, step: 1
            )
            .accentColor(.accentColor)
        }
    }
}

private extension SettingsView {
    func update() {
        lineCount = Int(value)
    }
}

#Preview {
    SettingsView()
}
