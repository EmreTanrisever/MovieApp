//
//  FavoriteMovieViewModel.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 29.06.2022.
//

import Foundation

struct FavoriteMovieViewModel {
    
    let key = "Deneme2"
    
    func readMoviesFromDB() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: key), let savedItems = try? JSONDecoder().decode([Movie].self, from: data) else { return [Movie]() }
        return savedItems
    }
    
    func deleteMovieFromFavoriteList(index: Int) {
        var movieArray = [Movie]()
        movieArray = readMoviesFromDB()
        movieArray.remove(at: index)
        savedMovieToDB(movies: movieArray)
    }

    func savedMovieToDB(movies: [Movie]) {
        if let newMovie = try? JSONEncoder().encode(movies) {
            UserDefaults.standard.set(newMovie, forKey: key)
        }
    }
}
