//
//  ClubListResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

// MARK: - ClubListResponseElement
struct ClubListResponseElement: Codable {
    let clubID: Int
    let filePath, clubName, openTime, closeTime: String

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case filePath, clubName, openTime, closeTime
    }
}

typealias ClubListResponse = [ClubListResponseElement]
