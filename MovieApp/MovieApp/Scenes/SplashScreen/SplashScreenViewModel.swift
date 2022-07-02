//
//  SplashScreenViewModel.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 2.07.2022.
//

import Foundation

protocol SplashScreenProtocol {
    func fetchMovies()
}

class SplashScreenViewModel: SplashScreenProtocol {
    
    
    private let movieService = MovieService()
    var movies = [Movie]()
    
    func fetchMovies() {
        movieService.fetchData(url: URL(string: Constant.MOVIE_URL), expecting: Movies.self) { result in
            switch result {
            case .success(let movies):
                AppManager.shared.movies = movies.results
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
}
