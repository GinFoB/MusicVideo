//
//  SettingTVC.swift
//  MusicVideo
//
//  Created by Akram khalifa on 31/03/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit

class SettingTVC: UITableViewController {

    
    @IBOutlet weak var aboutDisplay: UILabel!
    
    @IBOutlet weak var feedbackDiplay: UILabel!
    
    @IBOutlet weak var secuirtyDisplay: UILabel!
    
    @IBOutlet weak var touchID: UISwitch!
    
    @IBOutlet weak var bestImageDisplay: UISwitch!
    
    @IBOutlet weak var APICnt: UILabel!
    
    
    @IBOutlet weak var imageDis: UILabel!
    @IBOutlet weak var sliderCnt: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            "preferredChange", name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        
        tableView.alwaysBounceVertical = false
    }
    
    func preferredChange() {
        
        aboutDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
        feedbackDiplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
        secuirtyDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
        imageDis.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
        APICnt.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
  
        
    }
    
    deinit{
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification,object: nil)
    }

    
}
