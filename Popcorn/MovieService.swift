//
//  MovieService.swift
//  Popcorn
//
//  Created by Liqiang Ye on 2/11/18.
//  Copyright © 2018 Liqiang Ye. All rights reserved.
//

import Foundation
import AFNetworking

class MovieService {
    
    
    static let sharedInstance = MovieService()
    
    func getMovies(apiKey: String?, success: (([Movie]?) -> Void)!, failure: ((Error) -> Void)!) {
        
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey!)")
        
        var request = URLRequest(url: url!)
        
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)

        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: {
            (dataOrNil, response, error) in
            
            if let error = error {
                
                failure(error)
                
            } else if let data = dataOrNil{
                
                do  {

                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    guard let movieData = dictionary["results"] else { return }
                    
                    let json = try JSONSerialization.data(withJSONObject: movieData, options: [])
                    let movies = try JSONDecoder().decode([Movie].self, from: json)
                    
                    success(movies)
                    
                } catch let jsonError {
                    print("Error: \(jsonError.localizedDescription)")
                }
            }
        }
        );
        
        task.resume()
        
    }
    
    
}
