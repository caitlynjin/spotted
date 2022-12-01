//
//  NetworkManager.swift
//  spotted
//
//  Created by Caitlyn Jin on 11/30/22.
//

import Foundation
import Alamofire

class NetworkManager {

    static let host = "https://ios-course-message-board.herokuapp.com"      // TODO: edit later

    static func getAllUsers(completion: @escaping ([User]) -> Void) {
        let endpoint = "\(host)/api/user/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode([User].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    static func createUser(name: String, university: String, grade: Int, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/api/user/"
        let params: Parameters = [
            "name": name,
            "university": university,
            "grade": grade
        ]
        AF.request(endpoint, method: .post, parameters: params).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode createPost")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserProfile(id: Int) {
        let endpoint = "\(host)/api/user/\(id)/profile/"

    }
    
    static func getUserGame(id: Int) {
        let endpoint = "\(host)/api/user/\(id)/game/"
    }
    
    static func updateUserProfile(id: Int, name: String, university: String, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/api/user/\(id)/profile/"
        let params: [String: String] = [
            "name": name,
            "university": university
        ]
        AF.request(endpoint, method: .post, parameters: params, encoder: JSONParameterEncoder.default)
            .validate()
            .responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode createPost")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteUser(id: String, poster: String, completion: @escaping (Post) -> Void) {

    }
    
    static func addFriend(user_id: Int, friend_id: Int) {
        let endpoint = "\(host)/api/user/\(user_id)/friend/"
        let params: [String: Int] = [
            "friend_id": friend_id
        ]
    }
    
    static func changeGame(id: Int, game_id: Int) {
        let endpoint = "\(host)/api/user/\(id)/game/"
        let params: [String: Int] = [
            "game_id": game_id
        ]
    }
    
    static func createPost(id: Int, title: String, contents: String) {
        let endpoint = "\(host)/api/post/\(id)/"
        let params: [String: String] = [
            "title": title,
            "contents": contents
        ]
    }
    
    static func createComment(id: Int, user_id: Int, post_id: Int, contents: String) {
        let endpoint = "\(host)/api/comment/\(user_id)/\(post_id)/"
        let params: [String: String] = [
            "contents": contents
        ]
    }
    
    static func getPost(user_id: Int) {
        let endpoint = "\(host)/api/post/\(user_id)/"
    }
    
    static func getComments(post_id: Int) {
        let endpoint = "\(host)/api/comment/\(post_id)/"
    }
    
    static func deletePost(post_id: Int) {
        let endpoint = "\(host)/api/post/\(post_id)/"
    }
    
    static func deleteComment(comment_id: Int) {
        let endpoint = "\(host)/api/comment/\(comment_id)/"
    }
    
    static func deleteUser(user_id: Int) {
        let endpoint = "\(host)/api/user/\(user_id)/"
    }
}

