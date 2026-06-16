//
//  LifecycleDTOMapper.swift
//  Pods
//
//  Created by T80818 on 15/05/26.
//

internal enum LifecycleEntityMapper {

    static func map(
        dto: LifecycleResponseDTO
    ) -> LifecycleEntity {

        LifecycleEntity(
            partyLifecycleManagementId: dto.partyLifecycleManagementId,
            partyReference: mapPartyReference(dto.partyReference),
            planRecordReference: mapPlanRecordReference(
                dto.planRecordReference
            )
        )
    }
}

// MARK: - Private Mappers

private extension LifecycleEntityMapper {

    static func mapPartyReference(
        _ dto: PartyReferenceDTO
    ) -> PartyReferenceLC {

        PartyReferenceLC(
            partyType: dto.partyType,
            partyId: dto.partyId,
            partyIdentification: mapPartyIdentification(
                dto.partyIdentification
            )
        )
    }

    static func mapPartyIdentification(
        _ dto: PartyIdentificationDTO
    ) -> PartyIdentificationLC {

        PartyIdentificationLC(
            identifierValue: dto.identifierValue,
            partyIdentificationType: dto.partyIdentificationType,
            partyIdentification: mapNestedPartyIdentification(
                dto.partyIdentification
            )
        )
    }

    static func mapNestedPartyIdentification(
        _ dto: PartyIdentification
    ) -> PartyIdentificationLCC {

        PartyIdentificationLCC(
            identifierValue: dto.identifierValue
        )
    }

    static func mapPlanRecordReference(
        _ dto: PlanRecordReferenceResponseDTO
    ) -> PlanRecordReferenceLC {

        PlanRecordReferenceLC(
            planId: dto.planId
        )
    }
}
