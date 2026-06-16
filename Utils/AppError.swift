//
//  AppError.swift
//  Pods
//
//  Created by Christian Morante on 15/06/26.
//

enum AppError: Error {
    case invalidCredentials
    case unauthorized
    case validationError(String)
    case networkError(Error)
    case parsingError
    case unknown(Error?)
}
