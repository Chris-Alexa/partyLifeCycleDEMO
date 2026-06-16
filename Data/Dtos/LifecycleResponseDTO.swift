//
//  PartyRelationshipAdministrativePlanDTO.swift
//  Pods
//
//  Created by T80818 on 15/05/26.
//

internal struct LifecycleResponseDTO: Decodable {
    let partyLifecycleManagementId: Int
    let partyReference: PartyReferenceDTO
    let planRecordReference: PlanRecordReferenceResponseDTO
}

internal struct PartyReferenceDTO: Decodable {
    let partyType: PartyType
    let partyId: Int
    let partyIdentification: PartyIdentificationDTO
}

internal struct PartyIdentificationDTO: Decodable{
    let identifierValue: Int
    let partyIdentificationType: PartyIdentificationType
    let partyIdentification: PartyIdentification
}

internal struct PartyIdentification: Decodable {
    let identifierValue: String
}

internal struct PlanRecordReferenceResponseDTO: Decodable {
    let planId: Int
}
