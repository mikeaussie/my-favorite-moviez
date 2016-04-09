//
//  MovieCell.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import UIKit
import CoreData


class MoviezCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var webLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }


    func configureCell(movies: Movies) {
        titleLbl.text = movies.title
        descLbl.text = movies.desc
        webLbl.text = movies.web
        movieImg.image = movies.getMovieImg()
        
    }

}
