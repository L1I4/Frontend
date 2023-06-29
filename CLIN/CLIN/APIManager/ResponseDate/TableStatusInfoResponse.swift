//
//  TableStatusInfoResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//


import Foundation

// MARK: - ClubInfoResponseElement
struct TableStatusInfoResponseElement: Codable {
    let clubTableID, tableNumber, tableStatus: Int

    enum CodingKeys: String, CodingKey {
        case clubTableID = "clubTableId"
        case tableNumber, tableStatus
    }
}

typealias TableStatusInfoResponse = [TableStatusInfoResponseElement]

