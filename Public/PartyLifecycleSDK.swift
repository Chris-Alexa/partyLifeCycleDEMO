//
//  Facade.swift
//  Pods
//
//  Created by T80818 on 5/05/26.
//

public final class PartyLifecycleSDK {
        
    private let lifecycleManagementService: LifecycleManagementService
    public var configureLifecycle: ConfigureLifecycle
    
    public init(configureLifecycle: ConfigureLifecycle) {
        self.configureLifecycle = configureLifecycle
        let network = NetworkClient(configureLifecycle: configureLifecycle)
        let repository =
            PlanRepository(
                network: network
            )
        self.lifecycleManagementService =
            LifecycleManagementService(
                repository: repository
            )
    }
    
    ///Obtener el plan administrativo de ciclo de vida aplicable, con sus fases y campos
    public func getPlan(planId: Int) async throws -> PlanEntity {
        return try await lifecycleManagementService.getPlan(planId: planId)
    }
    
    ///Inciiar el plan administrativo del ciclo de vida de una persona u organización
    public func initLifeCycle(lifecycleRequest: LifecycleRequest) async throws -> LifecycleEntity{
        return try await lifecycleManagementService.initLifeCycle(lifecycleRequest: lifecycleRequest)
    }
    
    ///Ejecutar una fase del plan de ciclo de vida de una persona y organización
    public func executePhase(partyLifeCycleManagementId: String, object: Any) async throws -> Any {
        return try await lifecycleManagementService.executePhase(partyLifeCycleManagementId: partyLifeCycleManagementId,
                                                                 object: ExcecuteRequest())
    }
    
    public func getOTP(clientCode: String, referenceCode: String, onlineRiskAnalysis: String, opnType: String) {
        
    }
    
    public func validateOTP(code: String) async throws -> OTP {
        return OTP(seed: "", experiation: 1)
    }
        
}

public struct ConfigureLifecycle {
    public let authorization: String
    public let sessionUID: String
    public let deviceId: String
    public let headers: Headers
    public let retry: Retrys
    public let debug: Debug
    
    public init(authorization: String, sessionUID: String,
                deviceid: String, debug: Debug,
                headers: Headers, retry: Retrys)
    {
        self.authorization = authorization
        self.sessionUID = sessionUID
        self.deviceId = deviceid
        self.headers = headers
        self.retry = retry
        self.debug = debug
    }
}

public enum Channel: String {
    case yape = "yape"
    case bcp = "bcp"
    case telecredito = "telecredito"
}

public struct Headers {
    public let orgCode: String
    public let branchOfficeCode: String
    public let agencyCode: String
    public let opnCode: String
    public let opnNumber: String
    public let supervisorCode: String

    public init(orgCode: String,
                branchOfficeCode: String,
                agencyCode: String,
                opnCode: String,
                opnNumber: String,
                supervisorCode: String)
    {
        self.orgCode = orgCode
        self.branchOfficeCode = branchOfficeCode
        self.agencyCode = agencyCode
        self.opnCode = opnCode
        self.opnNumber = opnNumber
        self.supervisorCode = supervisorCode
    }
}

public struct Retrys {
    public let maxAttempts: Int
    public let timeoutMs: Int
    
    public init(maxAttempts: Int, timeoutMs: Int) {
        self.maxAttempts = maxAttempts
        self.timeoutMs = timeoutMs
    }
}

public struct Debug {
    public let enabled: Bool
    public let level: String
    public let exposeInternalDetails: Bool
    
    public init(enabled: Bool, level: String, exposeInternalDetails: Bool) {
        self.enabled = enabled
        self.level = level
        self.exposeInternalDetails = exposeInternalDetails
    }
}
