//
//  FavoriteTableViewCellExtension.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 29.06.2022.
//

import Foundation

extension FavoriteMoviesTableViewCell {
    
    func configure() {
        addSubview(movieImageView)
        contentView.addSubview(deleteMovieFromFavoriteListButton)
        addSubview(titleLabel)
        addSubview(averageLabel)
        
        setMovieImageViewConstraints()
        setAddToFavoriteButtonConstraints()
        setTitleLabelConstraint()
        setAverageLabelConstraints()
    }
    
    private func setAverageLabelConstraints() {
        averageLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    private func setAddToFavoriteButtonConstraints() {
        deleteMovieFromFavoriteListButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
    }
    
    private func setTitleLabelConstraint() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieImageView.snp_trailingMargin).offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalTo(deleteMovieFromFavoriteListButton.snp_leadingMargin).offset(-16)
        }
    }

    private func setMovieImageViewConstraints() {
        movieImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(150)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
}
