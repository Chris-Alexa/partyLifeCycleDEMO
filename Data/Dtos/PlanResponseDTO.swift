//
//  PlanResponse.swift
//  Pods
//
//  Created by T80818 on 12/05/26.
//

import Foundation

internal struct PlanResponse: Decodable {
    let planRecord: PlanRecordResponse
    let dataDirectories: [DataDirectoryResponse]
    let dataValues: [DataValueResponse]
}

// MARK: - PlanRecord

internal struct PlanRecordResponse: Decodable {
    let planIdentification: PlanIdentificationResponse
    let partyReference: PartyReferenceResponse
    let planDescription: String
    let version: Int
    let statusType: String
    let deletionIndicator: Bool
    let operationType: String
    let auditRecords: [AuditRecordResponse]
    let planPhaseRelationships: [PlanPhaseRelationshipResponse]
}

// MARK: - PlanIdentification

internal struct PlanIdentificationResponse: Decodable {
    let identifierValue: Int
}

// MARK: - PartyReference

internal struct PartyReferenceResponse: Decodable {
    let partyType: PartyType
}

// MARK: - AuditRecord

internal struct AuditRecordResponse: Decodable {
    let dateTimeContent: String
    let dateTimeType: String
    let userId: String
}

// MARK: - PlanPhaseRelationship

internal struct PlanPhaseRelationshipResponse: Decodable {
    let phaseRecordReference: PhaseRecordReferenceResponse
}

// MARK: - PhaseRecordReference

internal struct PhaseRecordReferenceResponse: Decodable {
    let phaseRecordIdentification: PhaseRecordIdentificationResponse
    let sequenceNumber: Int
    let mandatoryIndicator: Bool
    let repeatableIndicator: Bool
    let dataElementRecords: [DataElementRecordResponse]
}

// MARK: - PhaseRecordIdentification

internal struct PhaseRecordIdentificationResponse: Decodable {
    let identifierValue: Int
}

// MARK: - DataElementRecord

internal struct DataElementRecordResponse: Decodable {
    let dataElementIdentification: DataElementIdentificationResponse
    let dataElementDescription: String
    let informationTypeRecordReference: InformationTypeRecordReferenceResponse
    let mandatoryIndicator: Bool
}

// MARK: - DataElementIdentification

internal struct DataElementIdentificationResponse: Decodable {
    let identifierValue: Int
}

// MARK: - InformationTypeRecordReference

internal struct InformationTypeRecordReferenceResponse: Decodable {
    let informationTypeIdentification: InformationTypeIdentificationResponse
}

// MARK: - InformationTypeIdentification

internal struct InformationTypeIdentificationResponse: Decodable {
    let identifierValue: Int
}

// MARK: - DataDirectory

internal struct DataDirectoryResponse: Decodable {
    let dataDirectoryCode: String
    let dataDirectoryDescription: String
}

// MARK: - DataValue

internal struct DataValueResponse: Decodable {
    let dataValueCode: String
    let dataDirectoryReference: DataDirectoryReferenceResponse
    let dataValueLongDescription: String
    let dataValueShortDescription: String
    let dataValueAdditionalInformation: String
}

// MARK: - DataDirectoryReference

internal struct DataDirectoryReferenceResponse: Decodable {
    let dataDirectoryCode: String
}
