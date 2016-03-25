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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json",
            completion: didLoadData)
        
    }
    
    func didLoadData(videos: [Videos]){
        self.videos = videos
        
        for item in videos {
            print("for in name = \(item.vName)")
        }
        
        // for index
        
        for(index, item) in videos.enumerate(){
            print("\(index) name= \(item.vName)")
        }
    
    }
}

