//
//  Album.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

final class Album: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
    }
}
