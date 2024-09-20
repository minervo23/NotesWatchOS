//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Batuhan Kabaktepe on 20.09.24.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<3)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    var body: some View {
        VStack(spacing: 3) {
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            Text("Batu")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

#Preview {
    CreditsView()
}
