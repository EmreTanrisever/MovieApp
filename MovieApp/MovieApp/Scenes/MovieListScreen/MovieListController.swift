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
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movie List"
        
//        movies.getData { movies in
//            self.movieList = movies!
//            DispatchQueue.main.async {
//                self.movieListTableView.reloadData()
//            }
//        }
        
        configureMovieList()
        
        Task {
            movies = await viewModel.getMoviesFromService()
            movieListTableView.reloadData()
        }
    }

}



extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as? MovieListTableViewCell else { return UITableViewCell() }
        cell.setMovie(movies[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
