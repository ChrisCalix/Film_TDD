//
//  Movie.swift
//  Film_TDD
//
//  Created by Christian Calixto on 19/4/23.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?

    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
