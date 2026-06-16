//
//  GetPlanUseCase.swift
//  Pods
//
//  Created by T80818 on 11/05/26.
//

internal final class LifecycleManagementService {

    private let repository:
        PlanRepositoryProtocol

    init(repository: PlanRepositoryProtocol) {
        self.repository = repository
    }

    func getPlan(planId: Int) async throws -> PlanEntity {
        return try await repository.getPlan(planId: planId)
    }
    
    func initLifeCycle(lifecycleRequest: LifecycleRequest) async throws -> LifecycleEntity {
        return try await repository.initLifeCycle(lifecycleRequest: lifecycleRequest)
    }
    
    func executePhase(partyLifeCycleManagementId: String, object: ExcecuteRequest) async throws -> ExcecuteEntity{
        return try await repository.executePhase(partyLifeCycleManagementId: partyLifeCycleManagementId, object: object)
    }
    
}
