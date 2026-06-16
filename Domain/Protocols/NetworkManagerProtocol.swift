//
//  NetworkManagerProtocol.swift
//  Pods
//
//  Created by T80818 on 11/05/26.
//

import Alamofire

protocol NetworkManagerProtocol {
        
    func request<Response: Decodable, QueryParams: Encodable>(
        
        endpoint: EndPoints,
        method: HTTPMethod,
        queryParams: QueryParams?,
        headers: [String: String]?
    ) async throws -> Response
    
    func request<
        Response: Decodable,
        Body: Encodable
    >(
        endpoint: EndPoints,
        method: HTTPMethod,
        body: Body?,
        headers: [String: String]?
    ) async throws -> Response
    
}
