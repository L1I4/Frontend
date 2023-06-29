//
//  DataResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

struct DataResponse: Codable {
    let header: DataHeader
    let body: DataBody
}

// MARK: - Body
struct DataBody: Codable {
    let res: String
}

// MARK: - Header
struct DataHeader: Codable {
    let code: Int
    let message: String
}
