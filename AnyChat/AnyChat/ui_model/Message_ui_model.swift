//
//  Message_ui_model.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 28/04/2022.
//

import Foundation

struct Message: Identifiable, Decodable {
    let id: Int
    let content: String
    let author: Author
    let createdTime: Date
}

struct MessageResponse: Decodable {
    let request: [Message]
}

struct MockDataOfMessage {
    static let messages = [sampleMessage0,sampleMessage1, sampleMessage2, sampleMessage3, sampleMessage4, sampleMessage5, sampleMessage6, sampleMessage7, sampleMessage8, sampleMessage9, sampleMessage10, sampleMessage11, sampleMessage12]
    
    static let sampleMessage0 = Message(
        id: 00000000,
        content: "Hello",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-24*60*60)));
    static let sampleMessage1 = Message(
        id: 00000001,
        content: "Hello my dear friend!",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-24*60*60)));
    static let sampleMessage2 = Message(
        id: 00000002,
        content: "Hi, how are you today?",
        author: MockDataOfAuthor.authors[1],
        createdTime: Date().addingTimeInterval(TimeInterval(-23*60*60)));
    static let sampleMessage3 = Message(
        id: 00000003,
        content: "I'm fine, you look so mad, are you okay?",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-22*60*60)));
    static let sampleMessage4 = Message(
        id: 00000004,
        content: "Sure, i have an little problem of my children!",
        author: MockDataOfAuthor.authors[1],
        createdTime: Date().addingTimeInterval(TimeInterval(-21*60*60)));
    static let sampleMessage5 = Message(
        id: 00000005,
        content: "Oh, you want talk about Lily.",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-20*60*60)));
    static let sampleMessage6 = Message(
        id: 00000006,
        content: "Yeah, she so lound of anything, i can't stop her!",
        author: MockDataOfAuthor.authors[1],
        createdTime: Date().addingTimeInterval(TimeInterval(-19*60*60)));
    static let sampleMessage7 = Message(
        id: 00000007,
        content: "Oh, easy easy friend.",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-18*60*60)));
    static let sampleMessage8 = Message(
        id: 00000008,
        content: "I have to go, see u later bro!",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-17*60*60)));
    static let sampleMessage9 = Message(
        id: 00000009,
        content: "Growup!",
        author: MockDataOfAuthor.authors[0],
        createdTime: Date().addingTimeInterval(TimeInterval(-16*60*60)));
    static let sampleMessage10 = Message(
        id: 00000010,
        content: "Common, pls help me James.",
        author: MockDataOfAuthor.authors[1],
        createdTime: Date().addingTimeInterval(TimeInterval(-15*60*60)));
    static let sampleMessage11 = Message(
        id: 00000011,
        content: "I can't believe u speak that shit!",
        author: MockDataOfAuthor.authors[1],
        createdTime: Date().addingTimeInterval(TimeInterval(-14*60*60)));
    static let sampleMessage12 = Message(
        id: 00000012,
        content: "James.....",
        author: MockDataOfAuthor.authors[1],
        createdTime: Date().addingTimeInterval(TimeInterval(-13*60*60)));
}
