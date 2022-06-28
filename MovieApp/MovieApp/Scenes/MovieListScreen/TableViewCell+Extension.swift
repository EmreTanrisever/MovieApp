//
//  TableViewCell+Extension.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 27.06.2022.
//

import Foundation

extension MovieListTableViewCell {
    
    func configure() {
        addSubview(titleLabel)
        addSubview(averageLabel)
        
        setTitleLabelConstraint()
        setAverageLabelConstraints()
    }
    
    private func setTitleLabelConstraint() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setAverageLabelConstraints() {
        averageLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
            
        }
    }

}
