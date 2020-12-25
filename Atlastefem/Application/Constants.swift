//
//  Constants.swift
//  Atlastefem
//
//  Created by Jmorgaz on 25/12/20.
//

import Foundation

struct Constants {
    static let baseURL = infoForKey("baseURL")
    static let apiKey = infoForKey("apiKey")
    static let secret = infoForKey("secret")
}

func infoForKey(_ key: String) -> String {
        return Bundle.main.infoDictionary?[key] as! String
 }
