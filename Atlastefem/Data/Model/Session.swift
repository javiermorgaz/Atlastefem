//
//  Session.swift
//  Atlastefem
//
//  Created by Jmorgaz on 25/12/20.
//

import Foundation

struct SessionResponse: Codable {
    let session: Session
}

struct Session: Codable {
    let name: String
    let key: String
    let subscriber: Int
}
