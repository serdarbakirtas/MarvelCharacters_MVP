//
//  APIRequestType.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

import Alamofire

protocol APIRequestType {
    
    associatedtype Response: Decodable
    
    func path() -> String
    func method() -> HTTPMethod
    func query() -> [String: Any]?
}
