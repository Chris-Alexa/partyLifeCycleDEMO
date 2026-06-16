//
//  Constants.swift
//  Pods
//
//  Created by T80818 on 11/05/26.
//

enum EndPoints: String {
    case retrive = "/information-profiles/retrieve"
    case initiate = "/party-lifecycles-management/initiate"
    case execute = "/party-lifecycles-management/{partyLifecycleManagementId}/execute"
    case requestOTP = "JJ"
    case verifyOTP = "D"
}

// MARK: - Enum PartyType

public enum PartyType: String, Codable {
    case persona = "Persona"
    case organizacion = "Organizacion"
}

public enum PartyIdentificationType: String, Codable {
    case CarneExtranjeria = "CarneExtranjeria"
    case CarneIdentidad = "CarneIdentidad"
    case DocumentoNacionalIdentidad = "DocumentoNacionalIdentidad"
    case IdentificadorFicticio = "IdentificadorFicticio"
    case IdentificadorFicticioMigracion = "IdentificadorFicticioMigracion"
    case LibretaTributaria = "LibretaTributaria"
    case Pasaporte = "Pasaporte"
    case RegistroUnicoContribuyente = "RegistroUnicoContribuyente"
}
