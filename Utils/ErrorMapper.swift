//
//  ErrorMapper.swift
//  Pods
//
//  Created by Christian Morante on 15/06/26.
//

enum ErrorMapper {
    static func map(_ error: Error) -> AppError {
        if let urlError = error as? URLError {
            return .networkError(urlError)
        }
        if error is DecodingError {
            return .parsingError
        }
        // Agrega lógica para mapear códigos 401, 403, etc.
        return .unknown(error)
    }
}
