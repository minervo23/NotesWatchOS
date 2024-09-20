//
//  Note.swift
//  Notes Watch App
//
//  Created by Batuhan Kabaktepe on 20.09.24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
