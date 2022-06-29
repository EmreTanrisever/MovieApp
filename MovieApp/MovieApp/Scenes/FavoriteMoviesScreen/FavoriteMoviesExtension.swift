//
//  FavoriteMoviesExtension.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 29.06.2022.
//

import Foundation

extension FavoriteMovieController {
    
    func configure() {
        view.addSubview(favoriteMoviesTableView)
        
        setFavoriteMoviesTableViewConstraints()
    }
    
    private func setFavoriteMoviesTableViewConstraints() {
        favoriteMoviesTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
