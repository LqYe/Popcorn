//
//  Movie.swift
//  Popcorn
//
//  Created by Liqiang Ye on 2/11/18.
//  Copyright © 2018 Liqiang Ye. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    var id: Int64?
    var title: String?
    var poster_path: String?
    var backdrop_path: String?
    var overview: String?
    
}
