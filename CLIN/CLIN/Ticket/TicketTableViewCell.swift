//
//  TicketTableViewCell.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    weak var delegate: TicketCellDelegate?
    
    @IBOutlet weak var ticketStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ticketStackView.backgroundColor = .clear
        ticketStackView.layer.cornerRadius = 8
        ticketStackView.layer.borderColor = UIColor.black.cgColor
        ticketStackView.layer.borderWidth = 0.3
        
        ticketStackView.layer.shadowColor = UIColor.black.cgColor
        ticketStackView.layer.masksToBounds = false
        ticketStackView.layer.shadowRadius = 10
        ticketStackView.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        delegate?.confirmBtnTapped(in: self)
    }
    
}
