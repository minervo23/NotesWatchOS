//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Batuhan Kabaktepe on 20.09.24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new Note", text: $text)
                    addButton
                }
                
                Spacer()
                
                if !notes.isEmpty {
                    notesListView
                } else {
                    Spacer()
                    placeholderView
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .onAppear {
                load()
            }
        }
    }
}

private extension ContentView {
    var addButton: some View {
        Button {
            guard text.isEmpty == false else { return }
            let note = Note(id: UUID(), text: text)
            notes.append(note)
            text = ""
            save()
        } label: {
            Image(systemName: "plus.circle")
                .font(.system(size: 42, weight: .semibold))
        }
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
    }
    
    var notesListView: some View {
        List {
            ForEach(0..<notes.count, id: \.self) { index in
                NavigationLink(
                    destination: DetailView(
                        note: notes[index],
                        count: notes.count,
                        index: index)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                
                                Text(notes[index].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        }
            }
            .onDelete(perform: delete)
        }
    }
    
    var placeholderView: some View {
        Image(systemName: "note.text")
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray)
            .opacity(0.25)
            .padding(10)
    }
}

// MARK: - Functions
private extension ContentView {
    func getDocumentDirectory() ->  URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        //        dump(notes)
        
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("saving data has failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
}

#Preview {
    ContentView()
}
