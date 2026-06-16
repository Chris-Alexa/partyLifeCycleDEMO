//
//  ValidateOtpRequest.swift
//  Pods
//
//  Created by T80818 on 20/05/26.
//

internal struct ValidateOtpRequest: Encodable {
    let seed: String
    let value: Int
}
