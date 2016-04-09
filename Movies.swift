//
//  Movies.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movies: NSManagedObject {

    func setMovieImg(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
        
    }
    
    func getMovieImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
        
    }

}
