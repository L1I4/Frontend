//
//  TicketResponse.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

// MARK: - TicketResponseElement
struct TicketResponseElement: Codable {
    let clubName: String
    let generatedDate: String?
    let userStatus: String
}

typealias TicketResponse = [TicketResponseElement]
