//
//  MovieCell.swift
//  Popcorn
//
//  Created by Liqiang Ye on 2/10/18.
//  Copyright © 2018 Liqiang Ye. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var posterHeight: NSLayoutConstraint!
    @IBOutlet weak var posterWidth: NSLayoutConstraint!
    
    var movie: Movie! {
        
        didSet{
            
            
            self.titleLabel.text = movie.title
            self.overviewLabel.text = movie.overview
            
            var posterUrl: URL!
            let baseUrl = "http://image.tmdb.org/t/p/w500"
            
            if UIDevice.current.orientation.isLandscape {

                posterHeight.constant = 140
                posterWidth.constant = 240
                
                if let path = movie.backdrop_path {
                    
                    posterUrl = URL(string: baseUrl + path)
                    
                }
                
            } else {
                
                posterHeight.constant = 240
                posterWidth.constant = 160

                if let path = movie.poster_path {
                    
                    posterUrl = URL(string: baseUrl + path)
                    
                }
            }
            
           
            
            self.posterView.setImageWith(posterUrl!)
            
            
            
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
