//
//  MovieRequest.swift
//  MovieApp
//
//  Created by Emre Tanrısever on 24.06.2022.
//

import Foundation
import UIKit

class MovieService {
    
    private let url = "https://api.themoviedb.org/3/movie/popular?api_key=ea3d05bfba9559d3ec11726fd7d6b61e"
    
    func getData(completion: @escaping ([Movie]) -> ()) {
        let dataTask = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                guard let data = data , let response = response as? HTTPURLResponse else {
                    print("Error: Couldn't read response object.")
                    return
                }
    
                guard response.statusCode == 200 else {
                    print("Error: Server responded status \(response.statusCode)")
                    return
                }
    
                let decoder = JSONDecoder()
                let decodedData = try! decoder.decode(Movies.self, from: data)
                completion(decodedData.results)
            }
        }
        dataTask.resume()
    }

    func getData() async -> [Movie] {
        await withCheckedContinuation({ continuation in
            getData { movies in
                continuation.resume(returning: movies)
            }
        })
    }
    
}



//func getData(completion: @escaping ([Movie]?) -> ()) {
//    let dataTask = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//        if let error = error {
//            print("Error: \(error.localizedDescription)")
//        } else {
//            guard let data = data , let response = response as? HTTPURLResponse else {
//                print("Error: Couldn't read response object.")
//                return
//            }
//
//            guard response.statusCode == 200 else {
//                print("Error: Server responded status \(response.statusCode)")
//                return
//            }
//
//            let decoder = JSONDecoder()
//            let decodedData = try! decoder.decode(Movies.self, from: data)
//            completion(decodedData.results)
//        }
//    }
//    dataTask.resume()
//}

//func getData() {
//    let dataTask = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//        if let error = error {
//            print("Error: \(error.localizedDescription)")
//        } else {
//            guard let data = data , let response = response as? HTTPURLResponse else {
//                print("Error: Couldn't read response object.")
//                return
//            }
//
//            guard response.statusCode == 200 else {
//                print("Error: Server responded status \(response.statusCode)")
//                return
//            }
//
//            let decoder = JSONDecoder()
//            let _ = try! decoder.decode(Movies.self, from: data)
//            
//        }
//    }
//    dataTask.resume()
//}







//func getData(completion: @escaping ([Movie]?) -> ()) {
//    URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//        if let error = error {
//            print(error.localizedDescription)
//            completion(nil)
//        } else if let data = data {
//            let decodedData = try! JSONDecoder().decode(Movies.self, from: data)
//            completion(decodedData.results)
//        }
//    }.resume()
//}
