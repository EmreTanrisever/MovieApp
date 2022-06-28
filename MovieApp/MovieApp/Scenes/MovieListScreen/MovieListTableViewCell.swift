//
//  MovieListTableViewCell.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import UIKit
import SnapKit

class MovieListTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Deneme"
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
        titleLabel.text = movie.original_title
        averageLabel.text = "Average: \(String(movie.vote_average))"
        
        print("\(movie.overview) \n \(movie.original_title) \n \(movie.poster_path) \n \(movie.vote_average)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
