//
//  MovieListController+TableView.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 22.06.2022.
//

import Foundation
import UIKit

extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        return UITableViewCell()
    }
    
}
