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
    
    func getMoviesFromService() async -> [Movie] {
        return await networkService.getData()
    }

    func savedMovieToDB(movie: Movie) {
        var movies = readMovies()
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
