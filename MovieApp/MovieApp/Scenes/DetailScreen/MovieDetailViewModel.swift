//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 29.06.2022.
//

import Foundation

struct MovieDetailViewModel {
    private let networkService = MovieService()
    
    func getMoviesFromService() async -> [Movie] {
        return await networkService.getData()
    }
}
