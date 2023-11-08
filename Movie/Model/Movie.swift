//
//  Movie.swift
//  Movie
//
//  Created by Mustafa on 22/06/2023.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [Genre]
    let href: String?
    let extract: String?
    let thumbnail: String?
    let thumbnailWidth, thumbnailHeight: Int?
    let rating: Double = 8.4

    enum CodingKeys: String, CodingKey {
        case title, year, cast, genres, href, extract, thumbnail
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }
}

enum Genre: String, Codable {
    case action = "Action"
    case adventure = "Adventure"
    case animated = "Animated"
    case biography = "Biography"
    case comedy = "Comedy"
    case crime = "Crime"
    case dance = "Dance"
    case disaster = "Disaster"
    case documentary = "Documentary"
    case drama = "Drama"
    case erotic = "Erotic"
    case family = "Family"
    case fantasy = "Fantasy"
    case foundFootage = "Found Footage"
    case historical = "Historical"
    case horror = "Horror"
    case independent = "Independent"
    case legal = "Legal"
    case liveAction = "Live Action"
    case martialArts = "Martial Arts"
    case musical = "Musical"
    case mystery = "Mystery"
    case noir = "Noir"
    case performance = "Performance"
    case political = "Political"
    case romance = "Romance"
    case satire = "Satire"
    case scienceFiction = "Science Fiction"
    case short = "Short"
    case slasher = "Slasher"
    case sports = "Sports"
    case spy = "Spy"
    case superhero = "Superhero"
    case supernatural = "Supernatural"
    case teen = "Teen"
    case thriller = "Thriller"
    case war = "War"
    case western = "Western"
}

typealias Movies = [Movie]
