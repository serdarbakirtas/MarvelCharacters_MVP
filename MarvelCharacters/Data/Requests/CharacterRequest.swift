//
//  CharacterRequest.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

import Foundation
import Alamofire

public enum CharacterRequestType {
    case characters
}

struct CharacterRequest: APIRequestType {
    
    typealias Response = Marvel
    
    var apiRepo: CharacterRequestType
    
    init(apiRepo: CharacterRequestType) {
        self.apiRepo = apiRepo
    }
    
    func path() -> String {
        switch apiRepo {
        case .characters:
            return "characters"
        }
    }
    
    func method() -> HTTPMethod {
        switch apiRepo {
        case .characters:
            return .get
        }
    }
    
    func query() -> [String: Any]? {
        switch apiRepo {
        case .characters:
            let queryItems = ["apikey": "86fffd66696e825988a8507a4eeba7bf",
                              "ts": "1",
                              "hash": "eab17e843356c02bde6992456692b586" ] as [String : Any]
            return queryItems
        }
    }
}
