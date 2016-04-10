//
//  TestWebLoadVC.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 10/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import UIKit
import WebKit

class WebLoadVC: UIViewController {

    @IBOutlet weak var container: UIView!
    
    var webView: WKWebView!
    
    var webPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        container.addSubview(webView)
        
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        let address = webPath
                                // loadRequest("https://developer.apple.com/swift/blog/")
        loadRequest("\(address)")
    }
    
    func loadRequest(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
    }
    
    @IBAction func webBtnTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
