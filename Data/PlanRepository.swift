//
//  PlanRepository.swift
//  Pods
//
//  Created by T80818 on 11/05/26.
//

internal final class PlanRepository: PlanRepositoryProtocol {
    
    private let network: NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func getPlan(planId: Int) async throws -> PlanEntity {
                        
        let headers: [String: String] = [
            "ad" : "sad",
        ]
        
        let queryParams = PlanQueryParams(identifierValue: planId)
        
        let response: PlanResponse = try await network.request(endpoint: .retrive, method: .get, queryParams: queryParams, headers: headers)
        
        return PlanEntityMapper.map(response: response)
    }
    
    func initLifeCycle(lifecycleRequest: LifecycleRequest) async throws -> LifecycleEntity {
        
        let headers: [String: String] = [
            "orgCode" : "orgCode"
        ]
        
        //let request = LifecycleRequest(partyReference: partyReference, planRecordReference: planRecordReference)
        
        let response: LifecycleResponseDTO = try await network.request(endpoint: .initiate, method: .post, body: lifecycleRequest, headers: headers)
        
        return LifecycleEntityMapper.map(dto: response)
    }
    
    func executePhase(partyLifeCycleManagementId: String, object: ExcecuteRequest) async throws -> ExcecuteEntity {
        return ExcecuteEntity()
    }
        
}
