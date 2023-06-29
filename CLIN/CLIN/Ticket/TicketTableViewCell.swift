//
//  TicketTableViewCell.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    weak var delegate: TicketCellDelegate?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ticketStackView: UIStackView!
    var clubId : Int?
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "입장권"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let clubNameLabel: UILabel = {
        let label = UILabel()
        label.text = "CLUB"
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
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
        
        img.addSubview(clubNameLabel)
        img.addSubview(enterLabel)
        
        NSLayoutConstraint.activate([
            enterLabel.leadingAnchor.constraint(equalTo:  img.leadingAnchor, constant: 10),
            enterLabel.bottomAnchor.constraint(equalTo: img.bottomAnchor, constant: -10),
            
            clubNameLabel.leadingAnchor.constraint(equalTo:  img.leadingAnchor, constant: 10),
            clubNameLabel.bottomAnchor.constraint(equalTo: enterLabel.topAnchor, constant: 3)
        ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        delegate?.confirmBtnTapped(in: self)
    }
    
}
