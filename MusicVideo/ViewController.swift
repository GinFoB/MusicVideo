//
//  ViewController.swift
//  MusicVideo
//
//  Created by Akram khalifa on 23/03/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json",
            completion: didLoadData)
        
    }
    
    func didLoadData(result:String){
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) {action -> Void in
            //
            }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
}

