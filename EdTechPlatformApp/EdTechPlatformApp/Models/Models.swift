//
//  Models.swift
//  EdTechPlatformApp
//
//  Created by Dhruv Ruttala on 3/1/23.
//

import Foundation

struct Module: Decodable, Identifiable{
    var id: Int
    var Category: String
    var content: Content
    var quiz: Quiz
}

struct Content: Decodable, Identifiable{
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lessons]

}

struct Lessons: Decodable, Identifiable{
    
}
