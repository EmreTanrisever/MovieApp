//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var movies = MovieListController.movies
    var index = Int()
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "saved")
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.preferredMaxLayoutWidth = 350
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    let movieOverViewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 350
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let voteAverageLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let voteCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configure()
        setMovie(index)
    }
    
    private func setMovie(_ index: Int) {
        let movie = movies[index]
        let url = "https://image.tmdb.org/t/p/w500" + movie.poster_path
        movieImageView.kf.setImage(with: URL(string: url))
        movieTitleLabel.text = "Title: \(movie.original_title)"
        movieOverViewLabel.text = "Over View: \(movie.overview)"
        releaseDateLabel.text = "Release Date: \(movie.release_date)"
        voteAverageLabel.text = "Vote Average: \(movie.vote_average)"
        voteCountLabel.text = "Vote Count: \(movie.vote_count)"
    }
}
