//
//  NetworkClient.swift
//  Pods
//
//  Created by T80818 on 5/05/26.
//

import Alamofire

internal final class NetworkClient: NetworkManagerProtocol {
    
    private let baseURL = "https://api.banco.com.pe"
    private let configureLifecycle: ConfigureLifecycle
    
    init(configureLifecycle: ConfigureLifecycle) {
        self.configureLifecycle = configureLifecycle
    }
    
    func request<Response: Decodable, QueryParams: Encodable>(
        endpoint: EndPoints,
        method: HTTPMethod,
        queryParams: QueryParams?,
        headers: [String: String]?
    ) async throws -> Response {

        let url =
            baseURL + endpoint.rawValue

        let finalHeaders =
            buildHeaders(
                additionalHeaders:
                    headers
            )
        let parameters =
            try queryParams?.toDictionary()

        return try await
            withCheckedThrowingContinuation {
                continuation in

                AF.request(
                    url,
                    method:
                        mapMethod(method),
                    parameters:
                        parameters,
                    encoding:
                        URLEncoding.default,
                    headers:
                        HTTPHeaders(
                            finalHeaders
                        )
                )
                .validate()
                .responseDecodable(
                    of: Response.self
                ) { response in

                    switch response.result {

                    case .success(let value):

                        continuation.resume(
                            returning:
                                value
                        )

                    case .failure(let error):

                        continuation.resume(
                            throwing:
                                error
                        )
                    }
                }
            }
    }

    func request<
        Response: Decodable,
        Body: Encodable
    >(
        endpoint: EndPoints,
        method: HTTPMethod,
        body: Body?,
        headers: [String: String]?
    ) async throws -> Response {

        let url =
            baseURL + endpoint.rawValue

        let finalHeaders =
            buildHeaders(
                additionalHeaders:
                    headers
            )

        return try await
            withCheckedThrowingContinuation {
                continuation in

                AF.request(
                    url,
                    method:
                        mapMethod(method),
                    parameters: body,
                    encoder:
                        JSONParameterEncoder
                            .default,
                    headers:
                        HTTPHeaders(
                            finalHeaders
                        )
                )
                .validate()
                .responseDecodable(
                    of: Response.self
                ) { response in

                    switch response.result {

                    case .success(let value):

                        continuation.resume(
                            returning:
                                value
                        )

                    case .failure(let error):

                        continuation.resume(
                            throwing:
                                error
                        )
                    }
                }
            }
    }
    
    private func buildHeaders(
        additionalHeaders:
        [String: String]?
    ) -> [String: String] {
        
        var headers: [String: String] = [
            
            "Content-Type":
                "application/json",
            
            "Authorization":
                configureLifecycle.authorization,
            
            "sessionUID":
                configureLifecycle.sessionUID
        ]
        
        additionalHeaders?.forEach {
            headers[$0.key] = $0.value
        }
        
        return headers
    }
    
    private func mapMethod(
        _ method: HTTPMethod
    ) -> Alamofire.HTTPMethod {
        
        switch method {
            
        case .get:
            return .get
            
        case .post:
            return .post
            
        case .put:
            return .put
            
        case .delete:
            return .delete
        default:
            return .get
        }
    }
    
}

