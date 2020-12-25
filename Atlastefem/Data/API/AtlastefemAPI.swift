//
//  AtlastefemAPI.swift
//  Atlastefem
//
//  Created by Jmorgaz on 25/12/20.
//

import Foundation

enum AtlastefemAPI {

    case session(username: String, password: String)

    var httpMethod: String {

        switch self {
        case .session: return "POST"
        }
    }

    var method: String {

        switch self {
        case .session: return "auth.getMobileSession"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .session(let username, let password): return [
                               URLQueryItem(name: "username", value: username),
                               URLQueryItem(name: "password", value: password),
                               URLQueryItem(name: "method", value: method)]
        }
    }
}
