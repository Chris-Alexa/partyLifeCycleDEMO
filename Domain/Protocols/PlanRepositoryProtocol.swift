//
//  PlanRepositoryProtocol.swift
//  Pods
//
//  Created by T80818 on 11/05/26.
//

protocol PlanRepositoryProtocol {

    func getPlan(
        planId: Int
    ) async throws
    -> PlanEntity
    
    func initLifeCycle(lifecycleRequest: LifecycleRequest) async throws -> LifecycleEntity
    
    func executePhase(partyLifeCycleManagementId: String, object: ExcecuteRequest) async throws -> ExcecuteEntity
    
}
