//
//  Post.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

struct Post: Codable {
    var userId: UID
    var id: Int
    var title: String
    var body: String
    
    enum UID: Codable {

        case string(String)
        case int(Int)
        case undefined
        
        init(from decoder: Decoder) throws {
            let values = try decoder.singleValueContainer()
            if let id = try? values.decode(String.self) {
                self = .string(id)
                return
            }
            
            if let id = try? values.decode(Int.self) {
                self = .int(id)
                return
            }
            
            self = .undefined
        }
        
        func encode(to encoder: Encoder) throws {}
        
    }
    
}
