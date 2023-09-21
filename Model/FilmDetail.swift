//
//  FilmDetail.swift
//  Filmlist
//
//  Created by eyüp köse on 21.09.2023.
//

import Foundation

struct FilmDetail : Codable {
    
    let title : String
    let year : String
    let genre : String
    let director : String
    let writer : String
    let actors : String
    let plot : String
    let awards : String
    let poster : String
    let metaScore : String
    let imdbRating : String
    let imdbId : String
    
     enum CodingKeys : String, CodingKey{
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
    
}
