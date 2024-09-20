//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Batuhan Kabaktepe on 20.09.24.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    
    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .foregroundColor(.accentColor)
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

#Preview {
    HeaderView()
}

#Preview("Credits") {
    HeaderView(title: "Credits")
}
