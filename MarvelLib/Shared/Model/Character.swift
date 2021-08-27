//
//  Character.swift
//  MarvelLib
//
//  Created by wozdabady on 27.08.2021.
//

import SwiftUI

struct APIResult: Codable {
    var data: APICharcterData
}

struct APICharcterData: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String: String]
    var urls: [[String: String]]
}
