//
//  PlanEntity.swift
//  Pods
//
//  Created by T80818 on 5/05/26.
//


// MARK: - InformationProfileDirectoryEntry

import Foundation

public struct PlanEntity {
    let planRecord: PlanRecord
    let dataDirectories: [DataDirectory]
    let dataValues: [DataValue]
}

// MARK: - PlanRecord

public struct PlanRecord {
    let planIdentification: PlanIdentification
    let partyReference: PartyReference
    let planDescription: String
    let version: Int
    let statusType: String
    let deletionIndicator: Bool
    let operationType: String
    let auditRecords: [AuditRecord]
    let planPhaseRelationships: [PlanPhaseRelationship]
}

// MARK: - PlanIdentification

public struct PlanIdentification {
    let identifierValue: Int
}

// MARK: - PartyReference

public struct PartyReference {
    let partyType: PartyType
}

// MARK: - AuditRecord

public struct AuditRecord {
    let dateTimeContent: String
    let dateTimeType: String
    let userId: String
}

// MARK: - PlanPhaseRelationship

public struct PlanPhaseRelationship {
    let phaseRecordReference: PhaseRecordReference
}

// MARK: - PhaseRecordReference

public struct PhaseRecordReference {
    let phaseRecordIdentification: PhaseRecordIdentification
    let sequenceNumber: Int
    let mandatoryIndicator: Bool
    let repeatableIndicator: Bool
    let dataElementRecords: [DataElementRecord]
}

// MARK: - PhaseRecordIdentification

public struct PhaseRecordIdentification {
    let identifierValue: Int
}

// MARK: - DataElementRecord

public struct DataElementRecord {
    let dataElementIdentification: DataElementIdentification
    let dataElementDescription: String
    let informationTypeRecordReference: InformationTypeRecordReference
    let mandatoryIndicator: Bool
}

// MARK: - DataElementIdentification

public struct DataElementIdentification {
    let identifierValue: Int
}

// MARK: - InformationTypeRecordReference

public struct InformationTypeRecordReference {
    let informationTypeIdentification: InformationTypeIdentification
}

// MARK: - InformationTypeIdentification

public struct InformationTypeIdentification {
    let identifierValue: Int
}

// MARK: - DataDirectory

public struct DataDirectory {
    let dataDirectoryCode: String
    let dataDirectoryDescription: String
}

// MARK: - DataValue

public struct DataValue {
    let dataValueCode: String
    let dataDirectoryReference: DataDirectoryReference
    let dataValueLongDescription: String
    let dataValueShortDescription: String
    let dataValueAdditionalInformation: String
}

// MARK: - DataDirectoryReference

public struct DataDirectoryReference {
    let dataDirectoryCode: String
}
