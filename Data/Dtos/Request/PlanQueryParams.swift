//
//  PlanQueryParams.swift
//  Pods
//
//  Created by T80818 on 20/05/26.
//

public struct PlanQueryParams: Encodable {
    let identifierValue: Int
    
    init(identifierValue: Int) {
        self.identifierValue = identifierValue
    }
}
