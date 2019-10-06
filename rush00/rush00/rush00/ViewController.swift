//
//  ViewController.swift
//  rush00
//
//  Created by Rene Ramirez on 10/5/19.
//  Copyright © 2019 SwiftPiscine. All rights reserved.
//

import UIKit

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
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=a6df66754765aab6a38f08284dc49109") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, res, err) in
            if let res = res {
                print("RESULT: ")
                print(res)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("DATA: ")
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func test_btn(_ sender: Any) {
        getData()
    }
    
}
