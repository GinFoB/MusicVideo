//
//  MusicVideoTVC.swift
//  MusicVideo
//
//  Created by Akram khalifa on 26/03/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit

class MusicVideoTVC: UITableViewController {

    var videos = [Videos]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            "reachabilityStatusChanged", name: "reachabilityChanged", object: nil)
       
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            "preferredFontChange", name: UIContentSizeCategoryDidChangeNotification, object: nil)

        
        reachabilityStatusChanged()
        
      
    }
    
    func preferredFontChange(){
        print("preferred Font has Change")
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
        
        tableView.reloadData()
    }
    
    func reachabilityStatusChanged() {
        switch reachabilityStatus {
        case NOACCESS :
          //  view.backgroundColor = UIColor.redColor()
            dispatch_async(dispatch_get_main_queue()){
             
                let alert = UIAlertController(title: "No Internet Access", message: "Please make sure you are connected to the internet", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
                    action -> () in
                    print("Cancel")
                }
                
                let deleteAction = UIAlertAction(title: "Delete", style: .Destructive){
                    action -> () in
                    print("Deleted")
                }
                
                let okAction = UIAlertAction(title: "Ok", style: .Default){
                    action -> Void in
                    print("Ok")
                }
                
                alert.addAction(okAction)
                alert.addAction(cancelAction)
                alert.addAction(deleteAction)
                
                self.presentViewController(alert, animated: true, completion: nil)

                
            }
        default:
           // view.backgroundColor = UIColor.greenColor()
            if videos.count > 0
            {
                print("do not refresh API")
            }
            else{
                runAPI()
            }
           
        }
    
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "reachabilityChanged", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }
    
    private struct storyboard {
        static let cellReuseIdentifier = "cell"
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier(storyboard.cellReuseIdentifier, forIndexPath: indexPath) as! MusicVideoTableViewCell

        cell.video = videos[indexPath.row]
        
        return cell

    }
    
    func runAPI(){
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topaudiobooks/limit=20/json",
            completion: didLoadData)

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
