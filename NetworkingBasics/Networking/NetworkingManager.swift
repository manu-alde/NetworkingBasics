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
            .responseJSON{ response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let value):
                    let decoder = JSONDecoder()
                    do {
                        let users = try decoder.decode([User].self, from: value as! Data)
                        completion(.success(users))
                    } catch {
                        completion(.failure(error))
                    }
                }
        }
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
                case .success(let value):
                    let decoder = JSONDecoder()
                    do {
                        let albums = try decoder.decode([Album].self, from: value as! Data)
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
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let albums = try decoder.decode([Photo].self, from: data as! Data)
                        completion(.success(albums))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
