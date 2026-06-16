//
//  ViewController.swift
//  partyLifeCycleExample
//
//  Created by Christian Morante on 05/05/2026.
//  Copyright (c) 2026 Christian Morante. All rights reserved.
//

import UIKit
import Pods_partyLifeCycleExample_Example

class ViewController: UIViewController {
    
    var configure: ConfigureLifecycle?
    var partyLifecycleSDK: PartyLifecycleSDK?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let debug = Debug(enabled: true, level: "1", exposeInternalDetails: false)
        let headers = Headers(headerA: "da1", headerB: "ds1")
        let retry = Retrys(maxAttempts: 2, timeoutMs: 1000)
        
        self.configure = ConfigureLifecycle(
            authorization: "Bearer eysda", sessionUID: "e12s-s1s21-s12s",
            deviceid: "ed1d1", debug: debug,
            headers: headers, retry: retry)
        
        self.partyLifecycleSDK = PartyLifecycleSDK.init(
            configureLifecycle: configure!
        )
        
        Task {
            do {
                
                let plan = try await partyLifecycleSDK!.getPlan(
                    partyIdentificationType: .CarneExtranjeria,
                    operationType: "321",
                    birthDate: Date(),
                    clientCode: .bcp
                )
                
            } catch {
                print(error)
            }
        }
        
        Task {
            do {
                let response = try await partyLifecycleSDK!.initLifeCycle(
                    orgCode: "",
                    branchOfficeCode: "",
                    agencyCode: "",
                    opnCode: "",
                    opnNumber: "",
                    supervisorCode: "",
                    partyReference: PartyReferenceRequest(partyTypeRequest: .persona,
                                                          birthDate: "",
                                                          partyId: "",
                                                          partyIdentification: PartyIdentificationRequest(identifierValue: ""
                                                        )),
                    planRecordReference: PlanRecordReferenceRequest(operationType: "")
                )
            } catch {
                print(error)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func execute() {
        Task {
            do {
                let response = try await partyLifecycleSDK!.executePhase(partyLifeCycleManagementId: "", object: "")
            } catch {
                print(error)
            }
        }
    }
    
    func otp() {
        Task {
            do {
                let response = try await partyLifecycleSDK!.getOTP(clientCode: "clientCode", referenceCode: "referenceCode", onlineRiskAnalysis: "onlineRiskAnalysis", opnType: "opnType")
            } catch {
                print(error)
            }
        }
    }
    
    func verifyOTP() {
        Task {
            do {
                let response = try await partyLifecycleSDK!.validateOTP(code: "")
            } catch {
                print(error)
            }
        }
    }
    
}
