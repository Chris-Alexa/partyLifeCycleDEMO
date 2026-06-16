//
//  OtpResponseDTO.swift
//  Pods
//
//  Created by T80818 on 18/05/26.
//

internal struct OtpResponseDTO: Decodable {
    let seed: String
    let experiation: Int
}
