//
//  TicketResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

// MARK: - ClubInfoResponseElement
struct TicketResponseElement: Codable {
    let clubID: Int
    let clubName: String
    let generatedDate: [Int]
    let userStatus: String

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName, generatedDate, userStatus
    }
}

typealias TicketResponse = [TicketResponseElement]
