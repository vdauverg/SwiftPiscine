//
//  ViewController.swift
//  rush00
//
//  Created by Rene Ramirez on 10/5/19.
//  Copyright © 2019 SwiftPiscine. All rights reserved.
//

import UIKit

struct Movie: Decodable {
    let popularity: Double
    var voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int!
    let adult: Bool
    var backdropPath: String
    var orginalLanguage: String
    var orginalTitle: String
    let genreIDs: [Int]
    let title: String
    var rating: Double
    let overview: String
    var releaseDate: String
    
    private enum codingKey: String, CodingKey {
        case
        popularity,
        voteCount = "vote_count",
        video,
        posterPath = "poster_path",
        id,
        adult,
        backdropPath = "backdrop_path",
        originalLanguage = "original_language",
        originaltitle = "original_title",
        genreIDs,
        title,
        rating = "vote_average",
        overview,
        releaseDate = "release_date"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=a6df66754765aab6a38f08284dc49109") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, res, err) in
            if let res = res {
                print("RESULT: ")
                print(res)
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    let jsonString = try! JSONSerialization.data(withJSONObject: json, options: [])
                    let movies = try! decoder.decode(Movie.self, from: data)
                    print(movies)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    @IBAction func test_btn(_ sender: Any) {
        getData()
    }
    
}
