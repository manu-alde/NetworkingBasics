//
//  Comment.swift
//  NetworkingBasics
//
//  Created by Infinixsoft on 21/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

final class Comment: Codable{
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
    
    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}

/**
 {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
 }
*/
