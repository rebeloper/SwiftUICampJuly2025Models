//
//  Profile.swift
//  SwiftUICampJuly2025Models
//
//  Created by Alex Nagy on 09.07.2025.
//

import SwiftUI
import FirebaseFirestore

struct Profile: Codable, Identifiable {
    
    @DocumentID var id: String?
    
    var name: String
    var score: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case score
    }
    
    init(name: String = "", score: Int = 0) {
        self.name = name
        self.score = score
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(DocumentID.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.score = try container.decodeIfPresent(Int.self, forKey: .score) ?? 0
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.score, forKey: .score)
    }
}
