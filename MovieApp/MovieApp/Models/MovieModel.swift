//
//  MovieModel.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let original_title: String
    let overview: String 
    let poster_path: String
    let vote_average: Double
}
