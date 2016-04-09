//
//  DescVC.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import UIKit
import CoreData

class DescVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var storyLbl: UILabel!
    @IBOutlet weak var webLbl: UILabel!
    
    var index = 0
    var movies: [Movies]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            
            self.movies = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        fillTheView()
 
    }
    
    func fillTheView() {
        let array = movies[index]
        let story = array.story
        let title = array.title
        let desc = array.desc
        let web = array.web
                //print("getTheData function is operational")
        storyLbl.text = story
        titleLbl.text = title
        descLbl.text = desc
        webLbl.text = web
        movieImg.image = array.getMovieImg()
        
    }
    
    
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
