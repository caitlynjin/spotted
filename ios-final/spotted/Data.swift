//
//  Post.swift
//  spotted
//
//  Created by Karen Sabile on 11/27/22.
//

import UIKit

// TODO: Make variables optional if errors

class UserList: Encodable, Decodable {
    let users: [User]
}

class PostList: Encodable, Decodable {
    var posts: [Post]
}

class User: Encodable, Decodable {
    let id: Int
    
    let name: String
    let university: String
//    let imageName: String
    let grade: Int
    let game: Game?
    let friends: [User]?
    let target_of_card: [User]?
    let target_card: User?
    let email: String?
    let session_token: String?
    let session_expiration: String?
    let update_token: String?
//    init(name: String, imageName: String, caption: String) {
//        self.name = name
//        self.imageName = imageName
//        self.caption = caption
//    }
}

class Comment: Encodable, Decodable {
    let id: Int
    let user: User
    let contents: String
    let time: String
}

class Post: Encodable, Decodable {
    let id: Int
    let user: User
    let time: String
    let title: String
    let contents: String                // caption
    let comments: [Comment]
}

class Game: Encodable, Decodable {
    let id: Int
    let name: String
    let users: [User]
    let is_private: Bool
    let cards: [Card]
    
}

class Card: Encodable, Decodable {
    let id: Int
    let target: User
    let belong: [User]
    let game: Game
}
