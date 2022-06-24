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
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movie List"
        
        configureMovieList()
    }
    
}
