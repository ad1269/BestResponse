//
//  Post.swift
//  BestResponse
//
//  Created by AD Mohanraj on 1/18/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import Foundation
import PhotosUI

class User {
    // Username of the User
    let username: String
    
    // Add list of followers
    // Add profile picture
    // Add BRScore object
    let upvoteScore: Int
    let revealNum: Int
    let topPosts: Array<Post>
    let profilePic: UIImage
    let bio: String
    
    init() {
        username = "Random User"
        bio = "This is a random bio placeholder, for the default constructor for the User object."
        upvoteScore = 0
        revealNum = 0
        topPosts = Array<Post>()
        profilePic = UIImage(named: "profile.jpg")!
    }
}

class Comment {
    let commentText: String
    let upvotes: Int
    let downvotes: Int
    let poster: User
    
    init() {
        commentText = "This is a random comment"
        upvotes = 0
        downvotes = 0
        poster = User()
    }
}

class Post {
    // Number of upvotes and downvotes
    let upvotes: Int
    let downvotes: Int
    
    // Time when comments can no longer be made
    let expirationTime: Date
    
    // The content of the post (right now, it's just a string)
    let content: String
    let poster: User
    let comments: [Comment]
    
    init() {
        upvotes = 0
        downvotes = 0
        
        content = ""
        poster = User()
        
        expirationTime = Date(timeIntervalSinceNow: 10.0)
        comments = [Comment(), Comment(), Comment()]
    }
}
