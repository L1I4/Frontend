//
//  LoginResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let userID: Int
    let phoneNumber, name, type: String
    let clubJoined: Bool
    let joinedClubNo: Int

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case phoneNumber, name, type, clubJoined, joinedClubNo
    }
}
