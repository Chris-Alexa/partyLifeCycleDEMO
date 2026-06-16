//
//  PlanEntityMapper.swift
//  Pods
//
//  Created by T80818 on 15/05/26.
//

internal enum PlanEntityMapper {

    static func map(
        response: PlanResponse
    ) -> PlanEntity {

        PlanEntity(
            planRecord: mapPlanRecord(response.planRecord),
            dataDirectories: response.dataDirectories.map(mapDataDirectory),
            dataValues: response.dataValues.map(mapDataValue)
        )
    }
}

// MARK: - Private Mappers

private extension PlanEntityMapper {

    static func mapPlanRecord(
        _ response: PlanRecordResponse
    ) -> PlanRecord {

        PlanRecord(
            planIdentification: mapPlanIdentification(response.planIdentification),
            partyReference: mapPartyReference(response.partyReference),
            planDescription: response.planDescription,
            version: response.version,
            statusType: response.statusType,
            deletionIndicator: response.deletionIndicator,
            operationType: response.operationType,
            auditRecords: response.auditRecords.map(mapAuditRecord),
            planPhaseRelationships: response.planPhaseRelationships.map(mapPlanPhaseRelationship)
        )
    }

    static func mapPlanIdentification(
        _ response: PlanIdentificationResponse
    ) -> PlanIdentification {

        PlanIdentification(
            identifierValue: response.identifierValue
        )
    }

    static func mapPartyReference(
        _ response: PartyReferenceResponse
    ) -> PartyReference {

        PartyReference(
            partyType: mapPartyType(response.partyType)
        )
    }

    static func mapAuditRecord(
        _ response: AuditRecordResponse
    ) -> AuditRecord {

        AuditRecord(
            dateTimeContent: response.dateTimeContent,
            dateTimeType: response.dateTimeType,
            userId: response.userId
        )
    }

    static func mapPlanPhaseRelationship(
        _ response: PlanPhaseRelationshipResponse
    ) -> PlanPhaseRelationship {

        PlanPhaseRelationship(
            phaseRecordReference: mapPhaseRecordReference(
                response.phaseRecordReference
            )
        )
    }

    static func mapPhaseRecordReference(
        _ response: PhaseRecordReferenceResponse
    ) -> PhaseRecordReference {

        PhaseRecordReference(
            phaseRecordIdentification: mapPhaseRecordIdentification(
                response.phaseRecordIdentification
            ),
            sequenceNumber: response.sequenceNumber,
            mandatoryIndicator: response.mandatoryIndicator,
            repeatableIndicator: response.repeatableIndicator,
            dataElementRecords: response.dataElementRecords.map(
                mapDataElementRecord
            )
        )
    }

    static func mapPhaseRecordIdentification(
        _ response: PhaseRecordIdentificationResponse
    ) -> PhaseRecordIdentification {

        PhaseRecordIdentification(
            identifierValue: response.identifierValue
        )
    }

    static func mapDataElementRecord(
        _ response: DataElementRecordResponse
    ) -> DataElementRecord {

        DataElementRecord(
            dataElementIdentification: mapDataElementIdentification(
                response.dataElementIdentification
            ),
            dataElementDescription: response.dataElementDescription,
            informationTypeRecordReference: mapInformationTypeRecordReference(
                response.informationTypeRecordReference
            ),
            mandatoryIndicator: response.mandatoryIndicator
        )
    }

    static func mapDataElementIdentification(
        _ response: DataElementIdentificationResponse
    ) -> DataElementIdentification {

        DataElementIdentification(
            identifierValue: response.identifierValue
        )
    }

    static func mapInformationTypeRecordReference(
        _ response: InformationTypeRecordReferenceResponse
    ) -> InformationTypeRecordReference {

        InformationTypeRecordReference(
            informationTypeIdentification: mapInformationTypeIdentification(
                response.informationTypeIdentification
            )
        )
    }

    static func mapInformationTypeIdentification(
        _ response: InformationTypeIdentificationResponse
    ) -> InformationTypeIdentification {

        InformationTypeIdentification(
            identifierValue: response.identifierValue
        )
    }

    static func mapDataDirectory(
        _ response: DataDirectoryResponse
    ) -> DataDirectory {

        DataDirectory(
            dataDirectoryCode: response.dataDirectoryCode,
            dataDirectoryDescription: response.dataDirectoryDescription
        )
    }

    static func mapDataValue(
        _ response: DataValueResponse
    ) -> DataValue {

        DataValue(
            dataValueCode: response.dataValueCode,
            dataDirectoryReference: mapDataDirectoryReference(
                response.dataDirectoryReference
            ),
            dataValueLongDescription: response.dataValueLongDescription,
            dataValueShortDescription: response.dataValueShortDescription,
            dataValueAdditionalInformation: response.dataValueAdditionalInformation
        )
    }

    static func mapDataDirectoryReference(
        _ response: DataDirectoryReferenceResponse
    ) -> DataDirectoryReference {

        DataDirectoryReference(
            dataDirectoryCode: response.dataDirectoryCode
        )
    }

    static func mapPartyType(
        _ response: PartyType
    ) -> PartyType {

        switch response {

        case .persona:
            return .persona

        case .organizacion:
            return .organizacion
        }
    }
}
