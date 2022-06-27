//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 26.06.2022.
//

import Foundation

struct MovieListViewModel {
    private let networkService = MovieService()
    var movies = [Movie]()
    func getMoviesFromService() async -> [Movie] {
        return await networkService.getData()
    }
    
}
