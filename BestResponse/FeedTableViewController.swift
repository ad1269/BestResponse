//
//  FeedTableViewController.swift
//  BestResponse
//
//  Created by AD Mohanraj on 1/20/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    // List of active and inactive posts to be displayed by the table.
    var activePosts: [Post] = [Post(), Post(), Post()]
    var inactivePosts: [Post] = [Post(), Post()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title of the navigation bar
        title = "Feed"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Retrieves the post to be displayed for the given table index path.
    func getPostForIndexPath(_ indexPath: IndexPath) -> Post {
        if indexPath.section == 0 {
            return activePosts[indexPath.row]
        }
        return inactivePosts[indexPath.row]
    }
    
    // MARK: - Table view data source
    // These functions configure the UITableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Active posts
        if section == 0 {
            return activePosts.count
        }
        // Inactive posts
        return inactivePosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = getPostForIndexPath(indexPath)

        cell.textLabel?.text = post.content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Active Posts"
        }
        return "Inactive Posts"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let commentController = storyboard?.instantiateViewController(withIdentifier: "Comments") as! CommentTableViewController
        let post = getPostForIndexPath(indexPath)

        commentController.post = post
        self.navigationController?.pushViewController(commentController, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
