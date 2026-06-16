//
//  Extensions.swift
//  Pods
//
//  Created by T80818 on 20/05/26.
//

extension Encodable {

    func toDictionary() throws -> [String: Any] {

        let data =
            try JSONEncoder()
                .encode(self)

        let json =
            try JSONSerialization
                .jsonObject(with: data)

        return json as? [String: Any] ?? [:]
    }
}
