//
//  AppManager.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 2.07.2022.
//

import Foundation

class AppManager {
    static let shared: AppManager = .init()
    
    var movies: [Movie] = []
}
