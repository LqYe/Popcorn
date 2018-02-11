//
//  ViewController.swift
//  Popcorn
//
//  Created by Liqiang Ye on 2/7/18.
//  Copyright © 2018 Liqiang Ye. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    var apiKey: String!
    var endpoint: String!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension

        
        apiKey = "aad8a3c8529bf64b06e59e328c0f8c2b"
        MovieService.sharedInstance.getMovies(apiKey: apiKey, success: { (movies) in
            
            guard let movies = movies else {return}
            self.movies = movies
            self.tableView.reloadData()
            
        }) { (error) in
            print("Error: \(error.localizedDescription)")

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell  = tableView.cellForRow(at: indexPath) as! MovieCell
        cell.selectionStyle = .none
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }

}

