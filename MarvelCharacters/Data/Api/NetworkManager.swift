//
//  NetworkManager.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

import Alamofire
import Foundation

protocol ApiServiceType {
    func createSingleRequest<Request>(from request: Request,
                                      completion: @escaping (Result<Request.Response, Error>) -> Void)
    where Request: APIRequestType
}

class ApiService: ApiServiceType {
    
    static let BASE_URL = "https://gateway.marvel.com/v1/public/"
    
    func createSingleRequest<Request>(from request: Request,
                                      completion: @escaping (Result<Request.Response, Error>) -> Void)
    where Request: APIRequestType {
        let encoding: ParameterEncoding = (request.method() == .post ||
                                            request.method() == .put ||
                                            request.method() == .patch) ? JSONEncoding.default : URLEncoding.default
        
        AF.request(ApiService.BASE_URL + request.path(),
                                 method: request.method(),
                                 parameters: request.query(),
                                 encoding: encoding,
                                 headers: self.getAuthenticatedHeader())
            .validate()
            .responseJSON { responseJSON in
                guard let data = responseJSON.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Request.Response.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            }
    }
}

extension ApiService {
    
    private func getAuthenticatedHeader() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        return headers
    }
}
