//
//  Artist.swift
//  Spotify
//
//  Created by  Ivan Kamenev on 03.06.2021.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
