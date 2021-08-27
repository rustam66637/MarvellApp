//
//  Comic.swift
//  MarvelLib
//
//  Created by wozdabady on 27.08.2021.
//

import SwiftUI

struct APIComicResult: Codable {
    var data: APICComicData
}

struct APICComicData: Codable {
    var count: Int
    var results: [Comic]
}

struct Comic: Identifiable, Codable {
    var id: Int
    var title: String
    var description: String?
    var thumbnail: [String: String]
    var urls: [[String: String]]
}
