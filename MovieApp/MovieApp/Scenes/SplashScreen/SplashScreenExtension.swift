//
//  SplashScreenExtension.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import Foundation
import UIKit

extension SplashScreenController {
    
    func configure() {
        view.addSubview(iconLabel)
        setIconLabelConstraints()
        setIconLabelDesign()
    
        changedController()
        view.backgroundColor = .white
    }
    
    private func changedController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tabBarConfigure()
        }
    }
    
    private func setIconLabelDesign() {
        iconLabel.font = .systemFont(ofSize: 20, weight: .bold)
        iconLabel.textColor = .red
        iconLabel.text = "Movie Book"
    }
    
    private func setIconLabelConstraints() {
        iconLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func tabBarConfigure() {
        let tabBar = UITabBarController()
        let moviewListController = UINavigationController(rootViewController: MovieListController())
        moviewListController.title = "Movie List"
        
        let favoriteMoviewController = UINavigationController(rootViewController: FavoriteMovieController())
        favoriteMoviewController.title = "Favorite Movie"
        
        tabBar.setViewControllers([moviewListController, favoriteMoviewController], animated: false)
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.tabBar.backgroundColor = .lightText
        
        guard let items = tabBar.tabBar.items else { return }
                
        let images = ["list.and.film", "bag"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }

        self.present(tabBar, animated: true)
    }
}
