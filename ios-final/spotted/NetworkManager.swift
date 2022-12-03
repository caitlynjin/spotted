//
//  NetworkManager.swift
//  spotted
//
//  Created by Caitlyn Jin on 11/30/22.
//

import Foundation
import Alamofire
 
class NetworkManager {

    static let host = "http://34.145.159.97/"

    static func getAllPosts(completion: @escaping (PostList) -> Void) {
        let endpoint = "\(host)api/post/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(PostList.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    static func getUser(completion: @escaping (User) -> Void) {
//        print("hello")
//        let endpoint = "\(host)api/user/4/profile/"
//        AF.request(endpoint, method: .get).validate().responseData { response in
//            print("it has gone through")
//            switch response.result {
//            case .success(let data):
//                print("hello #2")
//                let jsonDecoder = JSONDecoder()
//                if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
//                    completion(userResponse)
//                    print("Decoding, success")
//                } else {
//                    print("Failed to decode getAllPosts")
//                }
//            case .failure(let error):
//                print("welp that was a fail")
//                print(error.localizedDescription)
//            }
//        }
//    }

    static func createPost(id: Int, title: String, contents: String, completion: @escaping (Post) -> Void) {
        let endpoint = "\(host)/api/post/\(id)/"
        let params: [String: String] = [
            "title": title,
            "contents": contents
        ]
        AF.request(endpoint, method: .post, parameters: params, encoder: JSONParameterEncoder.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Post.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode createPost")
                }

            case.failure(let error):
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
                    print("Failed to decode createUser")
                }

            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func getUserProfile(id: Int, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/api/user/4/profile/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
                    print("it worked")
                    completion(userResponse)
                } else {
                    print("Failed to decode getUserProfile")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func getUserGame(id: Int, completion: @escaping (Game) -> Void) {
        let endpoint = "\(host)/api/user/\(id)/game/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Game.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getUserGame")
                }

            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func updateUserProfile(id: Int, name: String, university: String, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/api/user/\(id)/profile/"
        let params: [String: String] = [
            "name": name,
            "university": university
        ]
        AF.request(endpoint, method: .post, parameters: params, encoder: JSONParameterEncoder.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode updateUserProfile")
                }

            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func deleteUser(id: String, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/api/user/\(id)/"
        AF.request(endpoint, method: .delete).validate().responseData { response in
            switch response.result {
            case .success(let data):
                print("Success")
                let jsonDecoder = JSONDecoder()
                if let userResponse = try?
                    jsonDecoder.decode(User.self, from: data) {
                    completion(userResponse)
                }
                else {
                    print("Failed to decode deletePost")
                }
            case.failure(let error):
                print("Failed")
                print(error.localizedDescription)
            }
        }
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

