//
//  ProfileViewController.swift
//  BestResponse
//
//  Created by Nabeel Mamoon on 1/19/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileLabel: UILabel!
    let user: User = User()
    
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Reveals: UILabel!
    @IBOutlet weak var ProfilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileLabel.text = user.username
        Score.text = String(user.upvoteScore)
        ProfilePicture = user.profilePic
        Reveals.text = String(user.revealNum)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
