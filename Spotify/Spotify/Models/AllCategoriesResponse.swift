//
//  AllCategoriesResponse.swift
//  Spotify
//
//  Created by  Ivan Kamenev on 15.07.2021.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items:[Category]
}

struct Category: Codable {
    let icons: [APIImage]
    let id: String
    let name: String
}
