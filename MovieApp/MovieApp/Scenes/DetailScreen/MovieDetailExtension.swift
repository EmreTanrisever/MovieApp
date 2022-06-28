//
//  MovieDetailExtension.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 29.06.2022.
//

import Foundation

extension MovieDetailViewController {
    
    
    func configure() {
        view.addSubview(movieImageView)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieOverViewLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(voteAverageLabel)
        view.addSubview(voteCountLabel)
        
        setMovieImageViewConstraints()
        setMovieTitleLabelConstraints()
        setMovieOverViewLabelConstraints()
        setReleaseDateLabelConstraints()
        setVoteAverageLabelConstraints()
        setVoteCountLabelConstraints()
    }
    
    private func setVoteCountLabelConstraints() {
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(voteAverageLabel.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setVoteAverageLabelConstraints() {
        voteAverageLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setReleaseDateLabelConstraints() {
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(movieOverViewLabel.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setMovieOverViewLabelConstraints() {
        movieOverViewLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setMovieTitleLabelConstraints() {
        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setMovieImageViewConstraints() {
        movieImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-56)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(300)
        }
    }
}
