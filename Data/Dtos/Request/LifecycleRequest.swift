//
//  LifecycleRequest.swift
//  Pods
//
//  Created by T80818 on 18/05/26.
//

public struct LifecycleRequest: Encodable {
    let partyReference: PartyReferenceRequest
    let planRecordReference: PlanRecordReferenceRequest
}

public struct PartyReferenceRequest: Encodable {
    
    let partyTypeRequest: PartyType
    let birthDate: String
    let partyId: String
    let partyIdentification: PartyIdentificationRequest

    public init(partyTypeRequest: PartyType,
         birthDate: String,
         partyId: String,
         partyIdentification: PartyIdentificationRequest) {
        self.partyTypeRequest = partyTypeRequest
        self.birthDate = birthDate
        self.partyId = partyId
        self.partyIdentification = partyIdentification
    }
}

public struct PartyIdentificationRequest: Encodable {
    let identifierValue: String
    
    public init(identifierValue: String) {
        self.identifierValue = identifierValue
    }
}

public struct PlanRecordReferenceRequest: Encodable {
    let operationType: String
    
    public init(operationType: String) {
        self.operationType = operationType
    }

}
