//
//  Photo.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

final class Photo: Codable {
    let id: Int?
    let title: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case url = "url"
    }
}
