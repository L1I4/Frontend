//
//  TicketCellDelegate.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

protocol TicketCellDelegate: AnyObject{
    func confirmBtnTapped(in cell:TicketTableViewCell)
}
