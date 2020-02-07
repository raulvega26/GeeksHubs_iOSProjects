//
//  Comment.swift
//  Christmapps
//
//  Created by user on 10/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    func value(at index: Int) -> Any {
        switch index {
        case 0:
            return postId
        case 1:
            return id
        case 2:
            return name
        case 3:
            return email
        case 4:
            return body
        default:
            assert(false)
        }
    }
}
