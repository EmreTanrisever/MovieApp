//
//  ViewController.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 18.06.2022.
//

import UIKit

class MovieListController: UIViewController {

    lazy var movieListTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.rowHeight = 160
        return tableView
    }()
    
    private var viewModel = MovieListViewModel()
    weak var delegate: FavoriteMovieControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movie List"

        configureMovieList()
//
//        Task {
//            MovieListController.movies = await viewModel.getMoviesFromService()
//            movieListTableView.reloadData()
//        }
    }
    
    @objc func addButtonAction(sender: UIButton) {
        viewModel.savedMovieToDB(movie: AppManager.shared.movies[sender.tag])
        FavoriteMovieController().refresh()
    }

}

// MARK: - TableView Extension
extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppManager.shared.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as? MovieListTableViewCell else { return UITableViewCell() }
        cell.setMovie(AppManager.shared.movies[indexPath.row])
        cell.addToFavoriteButton.tag = indexPath.row
        cell.addToFavoriteButton.addTarget(self, action: #selector(addButtonAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = MovieDetailViewController()
        viewController.index = indexPath.row
        navigationController?.pushViewController(viewController, animated: true)
    }
}
