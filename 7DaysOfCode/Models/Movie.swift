//
//  Movie.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 17/11/22.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let releaseDate: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case poster = "poster_path"
    }
}
