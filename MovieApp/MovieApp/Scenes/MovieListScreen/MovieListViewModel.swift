//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 26.06.2022.
//

import Foundation

struct MovieListViewModel {
    private let networkService = MovieService()
    private let key = "Deneme2"
    private var isItSaved = false
    
    func getMoviesFromService() async -> [Movie] {
        return await networkService.getData()
    }

    mutating func savedMovieToDB(movie: Movie) {
        var movies = readMovies()
        for newMovie in movies {
            if newMovie.original_title == movie.original_title {
                self.isItSaved = true
                return
            }
        }
        movies.append(movie)
        if let newMovie = try? JSONEncoder().encode(movies) {
            UserDefaults.standard.set(newMovie, forKey: key)
        }
    }
    
    private func readMovies() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: key), let savedItems = try? JSONDecoder().decode([Movie].self, from: data) else { return [Movie]() }
        return savedItems
    }
    
}
