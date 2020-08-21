//
//  Result.swift
//  NetworkingBasics
//
//  Created by Infinixsoft on 21/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

public enum Result<A, B> {
    case success(A)
    case failure(B)
}
