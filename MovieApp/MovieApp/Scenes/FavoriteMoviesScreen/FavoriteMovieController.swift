//
//  FavoriteMovieController.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import UIKit

protocol FavoriteMovieControllerDelegate: FavoriteMovieController {
    func refresh()
}

class FavoriteMovieController: UIViewController, FavoriteMovieControllerDelegate {

    lazy var favoriteMoviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteMoviesTableViewCell.self, forCellReuseIdentifier: "FavoriteMoviesTableViewCell")
        tableView.rowHeight = 160
        return tableView
    }()
    
    let viewModel = FavoriteMovieViewModel()
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Favorite Movie"
        configure()
        
        movies = viewModel.readMoviesFromDB()
    }
    
    @objc func deleteButtonAction(sender: UIButton) {
        viewModel.deleteMovieFromFavoriteList(index: sender.tag)
        movies = viewModel.readMoviesFromDB()
        favoriteMoviesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refresh()
    }
    
    func refresh() {
        movies = viewModel.readMoviesFromDB()
        favoriteMoviesTableView.reloadData()
    }

}

extension FavoriteMovieController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMoviesTableViewCell") as? FavoriteMoviesTableViewCell else { return UITableViewCell() }
        cell.setMovie(movies[indexPath.row])
        cell.deleteMovieFromFavoriteListButton.tag = indexPath.row
        cell.deleteMovieFromFavoriteListButton.addTarget(self, action: #selector(deleteButtonAction(sender: )), for: .touchUpInside)
        return cell
    }
}
