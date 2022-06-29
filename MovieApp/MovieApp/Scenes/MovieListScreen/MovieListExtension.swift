//
//  File.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import Foundation
import SnapKit

extension MovieListController {
    
    func configureMovieList() {
        view.addSubview(movieListTableView)
        setMovieListTableViewConstraints()
    }
    
    private func setMovieListTableViewConstraints() {
        movieListTableView.snp.makeConstraints { make in
            make.top.equalToSuperview() //equalTo(navigationController.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview() //equalTo(tabBarController.snp.top)
        }
    }
    
    
}
