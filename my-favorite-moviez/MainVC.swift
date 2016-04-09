//
//  ViewController.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import UIKit
import CoreData


class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        tableView.reloadData()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MoviezCell") as? MoviezCell {
            let moviez = movies[indexPath.row]
            cell.configureCell(moviez)
                cell.webBtn.tag = indexPath.row
                cell.descBtn.tag = indexPath.row
            
            return cell
        } else {
            return MoviezCell()
        }

    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 127
        
    }
    
    func eraseAll() {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

        if segue.identifier == "webSeg" {
            if let destVC = segue.destinationViewController as? WebViewVC {
                let index = sender.tag
                let array = movies[index]
                let web = array.web
                destVC.web = web!
            }
        } else if segue.identifier == "descSeg" {
            if let destVC = segue.destinationViewController as? DescVC {
                let index = sender.tag
                let array = movies[index]
                    let title = array.title
                    let desc = array.desc
                destVC.tit = title!
                destVC.des = desc!
                
            }
        }
    }
}

