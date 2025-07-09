//
//  Profile.swift
//  SwiftUICampJuly2025Models
//
//  Created by Alex Nagy on 09.07.2025.
//

import SwiftUI
import FirebaseFirestore

public struct Profile: Codable, Identifiable {
    
    @DocumentID public var id: String?
    
    public var name: String
    public var score: Int
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case score
    }
    
    public init(name: String = "", score: Int = 0) {
        self.name = name
        self.score = score
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(DocumentID.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.score = try container.decodeIfPresent(Int.self, forKey: .score) ?? 0
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.score, forKey: .score)
    }
}
