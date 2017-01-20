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
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Reveals: UILabel!
    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var BioTextView: UITextView!
    
    let user: User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileLabel.text = user.username
        BioTextView.text = user.bio
        Score.text = String(user.upvoteScore)
        ProfilePicture.image = user.profilePic
        Reveals.text = String(user.revealNum)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
