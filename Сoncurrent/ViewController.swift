//
//  ViewController.swift
//  Сoncurrent
//
//  Created by Ivan on 12/17/18.
//  Copyright © 2018 Ivan Prybolovetz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let urlStr = "https://citydog.by/content/_posts/442X361/5baf9bd2e012d.jpeg?34"
    var url:NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = 50.0
        image.layer.masksToBounds = true
        url = NSURL(string:urlStr)
        indicator.startAnimating()
        indicator.isHidden = true
        
        
    }
    
    @IBAction func downloadTapped(_ sender: Any) {
        
        //        let data = NSData(contentsOf: url as URL)
        //        self.imageView.image = UIImage(data: data as! Data)
        //
        indicator.isHidden = false
        
        URLSession.shared.dataTask(with: (url as URL), completionHandler: {(data, resp, error) -> Void in
            if (error == nil && data != nil) {
                //                DispatchQueue.main.async(execute: {
                //                    self.imageView.image = UIImage(data: data!)
                //                })
                
                OperationQueue.main.addOperation({
                    self.indicator.isHidden = true
                    self.image.image = UIImage(data: data!)
                })
            }
        }).resume()
    }
    
    
    
}
