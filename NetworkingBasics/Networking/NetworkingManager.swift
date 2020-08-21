//
//  NetworkingManager.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

enum NetworkingManager {
    static func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/users",
                          method: .get,
                          parameters:nil
            )
            .responseJSON(completionHandler: {(response: DataResponse<Any>) in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success( _):
                    let decoder = JSONDecoder()
                    do {
                        let users = try decoder.decode([User].self, from: response.data!)
                        completion(.success(users))
                    } catch {
                        completion(.failure(error))
                    }
                }
        })
    }
    
    static func getAlbums(for user: User, completion: @escaping (Result<[Album], Error>) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/albums",
                          method: .get,
                          parameters: ["userId": user.id!]
            )
            .responseJSON{ response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success( _):
                    let decoder = JSONDecoder()
                    do {
                        let albums = try decoder.decode([Album].self, from: response.data!)
                        completion(.success(albums))
                    } catch {
                        completion(.failure(error))
                    }
                }
        }
    }
    
    static func getPhotos(in album: Album, completion: @escaping (Result<[Photo], Error>) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/photos",
                          method: .get,
                          parameters: ["albumId": album.id!]
            )
            .responseJSON{ response in
                switch response.result {
                case .success( _):
                    let decoder = JSONDecoder()
                    do {
                        let albums = try decoder.decode([Photo].self, from: response.data!)
                        completion(.success(albums))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
        
    }
    
    static func getPosts(for user: User, completion: @escaping (Result<[Post], Error>) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts",
                          method: .get,
                          parameters: ["userId": user.id!]
            )
            .responseJSON{ response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success( _):
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode([Post].self, from: response.data!)
                        completion(.success(posts))
                    } catch {
                        completion(.failure(error))
                    }
                }
        }
    }
    
    static func getComments(for post: Post, completion: @escaping (Result<[Comment], Error>) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/comments",
                          method: .get,
                          parameters: ["postId": post.id!]
            )
            .responseJSON{ response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success( _):
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode([Comment].self, from: response.data!)
                        completion(.success(posts))
                    } catch {
                        completion(.failure(error))
                    }
                }
        }
    }
}
