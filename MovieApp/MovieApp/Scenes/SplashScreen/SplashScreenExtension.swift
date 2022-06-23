//
//  SplashScreenExtension.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import Foundation

extension SplashScreenController {
    
    func configure() {
        view.addSubview(iconLabel)
        setIconLabelConstraints()
        setIconLabelDesign()
    
        changedController()
    }
    
    private func changedController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

        }
    }
    
    private func setIconLabelDesign() {
        iconLabel.font = .systemFont(ofSize: 20, weight: .bold)
        iconLabel.textColor = .red
        iconLabel.text = "Nestfilist"
    }
    
    private func setIconLabelConstraints() {
        iconLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
}
