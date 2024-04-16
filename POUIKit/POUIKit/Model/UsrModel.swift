//
//  UsrModel.swift
//  POUIKit
//
//  Created by Wiktor Witkowski on 10/04/2024.
//

import Foundation

struct usrModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}


