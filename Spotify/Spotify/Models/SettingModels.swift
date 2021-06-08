//
//  SettingModels.swift
//  Spotify
//
//  Created by  Ivan Kamenev on 04.06.2021.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
