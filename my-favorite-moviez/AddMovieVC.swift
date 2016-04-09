//
//  AddMovieVC.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var descLbl: UITextField!
    @IBOutlet weak var storyLbl: UITextField!
    @IBOutlet weak var webLbl: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
         imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func addImg(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMovie(sender: AnyObject) {
        if let title = titleLbl.text where title != "" {
            if movieImg.image != nil {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
            let movie = Movies(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.title = titleLbl.text
            movie.desc = descLbl.text
            movie.story = storyLbl.text
            movie.web = webLbl.text
            movie.setMovieImg(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Unable to save a movie")
            }
        }
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    }
    
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
