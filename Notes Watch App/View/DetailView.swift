//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Batuhan Kabaktepe on 20.09.24.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    
    @State var isCreditsPresented: Bool = false
    @State var isSettingsPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
//            headerView
            Spacer()
            contentView
            Spacer()
            footerView
        }
        .padding(3)
    }
}

// MARK: - Subviews^1vgf8q12q   21defr
private extension DetailView {
    
    var contentView: some View {
        ScrollView(.vertical) {
            Text(note.text)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
    
    var footerView: some View {
        HStack(alignment: .center) {
            Image(systemName: "gear")
                .onTapGesture {
                    isSettingsPresented.toggle()
                }
                .sheet(isPresented: $isSettingsPresented) {
                    SettingsView()
                }
            Spacer()
            Text("\(count) / \(index + 1)")
            Spacer()
            Image(systemName: "info.circle")
                .onTapGesture {
                    isCreditsPresented.toggle()
                }
                .sheet(isPresented: $isCreditsPresented) {
                    CreditsView()
                }
        }
        .foregroundColor(.secondary)
    }
}

#Preview {
    var sampleData = Note(id: UUID(), text: "Hello, World!")
    DetailView(note: sampleData, count: 5, index: 1)
}
