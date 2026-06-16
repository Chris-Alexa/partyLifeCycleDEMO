//
//  LifecycleEntity.swift
//  Pods
//
//  Created by T80818 on 15/05/26.
//

public struct LifecycleEntity {
    let partyLifecycleManagementId: Int
    let partyReference: PartyReferenceLC
    let planRecordReference: PlanRecordReferenceLC
}

public struct PartyReferenceLC {
    let partyType: PartyType
    let partyId: Int
    let partyIdentification: PartyIdentificationLC
}

public struct PartyIdentificationLC {
    let identifierValue: Int
    let partyIdentificationType: PartyIdentificationType
    let partyIdentification: PartyIdentificationLCC
}

public struct PartyIdentificationLCC {
    let identifierValue: String
}

public struct PlanRecordReferenceLC {
    let planId: Int
}
