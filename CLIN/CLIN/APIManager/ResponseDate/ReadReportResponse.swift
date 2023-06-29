//
//  ReadReportResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

// MARK: - ReadReportResponseElement
struct ReadReportResponseElement: Codable {
    let userID: Int
    let name: String
    let tableNumber: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, tableNumber, message
    }
}

typealias ReadReportResponse = [ReadReportResponseElement]
