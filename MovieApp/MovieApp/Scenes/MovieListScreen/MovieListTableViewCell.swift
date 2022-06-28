//
//  MovieListTableViewCell.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import UIKit
import SnapKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let addToFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "saved"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.preferredMaxLayoutWidth = 200
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    let averageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    func setMovie(_ movie: Movie) {
        let url = "https://image.tmdb.org/t/p/w500" + movie.poster_path
        movieImageView.kf.setImage(with: URL(string: url))
        titleLabel.text = movie.original_title
        averageLabel.text = "Average: \(String(movie.vote_average))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
