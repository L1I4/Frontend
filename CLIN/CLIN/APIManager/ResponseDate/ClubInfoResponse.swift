//
//  ClubInfoResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//


import Foundation

// MARK: - ClubInfoResponse
struct ClubInfoResponse: Codable {
    let clubID: Int
    let clubName: String
    let capacity, ticketPrice: Int
    let djName, openTime, closeTime, description: String
    let filePath: String

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName, capacity, ticketPrice, djName, openTime, closeTime, description, filePath
    }
}

