//
//  ViewController.swift
//  MusicVideo
//
//  Created by Akram khalifa on 23/03/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            "reachabilityStatusChanged", name: "reachabilityChanged", object: nil)
        
        reachabilityStatusChanged()
       
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json",
            completion: didLoadData)
        
    }
    
    func didLoadData(videos: [Videos]){
        
        print(reachabilityStatus)
        
        self.videos = videos
        
        for item in videos {
            print("for in name = \(item.vName)")
        }
        
        // for index
        
        for(index, item) in videos.enumerate(){
            print("\(index) name= \(item.vName)")
        }
    
    }
    
    func reachabilityStatusChanged() {
        switch reachabilityStatus {
        case NOACCESS : view.backgroundColor = UIColor.redColor()
            displayLabel.text = "No Internet"
            
        case WIFI : view.backgroundColor = UIColor.greenColor()
            displayLabel.text = "Reachabity with WIFI"
            
        case WWAN : view.backgroundColor = UIColor.yellowColor()
        displayLabel.text = "Reachabity with WWAN"
            
        default:return
        }
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "reachabilityChanged", object: nil)
    }
    
    
}

