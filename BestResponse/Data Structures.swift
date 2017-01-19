//
//  Post.swift
//  BestResponse
//
//  Created by AD Mohanraj on 1/18/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import Foundation

class User {
    // Username of the User
    let username: String
    
    // Add list of followers
    // Add profile picture
    // Add BRScore object
    
    init() {
        username = ""
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
    
    init() {
        upvotes = 0
        downvotes = 0
        
        content = ""
        poster = User()
        
        expirationTime = Date(timeIntervalSinceNow: 10.0)
    }
}
