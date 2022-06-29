//
//  FavoriteMovieController.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import UIKit

class FavoriteMovieController: UIViewController {

    lazy var favoriteMoviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteMoviesTableViewCell.self, forCellReuseIdentifier: "FavoriteMoviesTableViewCell")
        tableView.rowHeight = 160
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Favorite Movie"
        configure()
        
    }
}

extension FavoriteMovieController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMoviesTableViewCell") as? FavoriteMoviesTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
