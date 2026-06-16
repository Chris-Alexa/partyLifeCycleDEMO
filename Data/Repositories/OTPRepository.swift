//
//  OTPRepository.swift
//  Pods
//
//  Created by T80818 on 17/05/26.
//

internal final class OTPRepository {
    
    private let network: NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func requestOTP(clientCode: String, referenceCode: String, onlineRiskAnalysis: String, opnType: String) {
        let body: [String: Any] = [
            "userCode": ""
        ]
        
        let headers: [String: String] = [
            "authorization" : "authorization",
        ]
        
         //network.post(endpoint: .requestOTP, body: body, headers: headers)
    }
    
    func verifyOTP(code: String) async throws -> OtpResponseDTO {
        
        let otpRequestDTO = OtpRequest(referenceCode: "asd")

        let headers: [String: String] = [
            "authorization" : "authorization",
        ]
        
        let response: OtpResponseDTO = try await network.request(endpoint: .verifyOTP, method: .post, body: otpRequestDTO, headers: headers)
        
        return response
    }
}
