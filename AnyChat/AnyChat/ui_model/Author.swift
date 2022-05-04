//
//  Message_ui_model.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 28/04/2022.
//

import Foundation

struct Author: Identifiable, Decodable {
    let id: Int
    let name: String
    let age: Date
    let bio: String
    let createdTime: Date
}

struct AuthorResponse: Decodable {
    let request: [Author]
}

struct MockDataOfAuthor {
    static let authors = [sampleAuthor1, sampleAuthor2]
    
    static let sampleAuthor1 = Author(
        id: 10000001,
        name: "James Young",
        age: Date(),
        bio: "This is bio of author",
        createdTime: Date());
    static let sampleAuthor2 = Author(
        id: 10000002,
        name: "John Carter",
        age: Date(),
        bio: "This is bio of author",
        createdTime: Date());
}
