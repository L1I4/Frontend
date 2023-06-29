//
//  ClubListTableViewCell.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit

class ExpandingState{
    
    //확장되어 있다면 true
    var is_expanded: Bool
    
    init(){
        self.is_expanded = false //table view cell의 초기 상태는 확장되지 않은 상태여야 함
    }
}

class ClubListTableViewCell: UITableViewCell {
    var clubId: Int?
    @IBOutlet weak var expandView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var clubImg: UIImageView!
    
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var stateIcon: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var liquidPriceLabel: UILabel!
    @IBOutlet weak var genderRateLabel: UILabel!
    @IBOutlet weak var djLabel: UILabel!
    @IBOutlet weak var festivalLabel: UILabel!
    
    weak var delegate: ClubListCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //is_expanded가 true면 table view cell이 펴진 상태임
    func settingData(tapped :ExpandingState ){
        if tapped.is_expanded == true
        {
            self.label.isHidden = true
            self.label2.isHidden = false
            self.expandView.isHidden = false
            self.expandView.alpha = 1
            
        }
        else
        {
            self.label.isHidden = false
            self.label2.isHidden = true
            self.expandView.isHidden = true
            self.expandView.alpha = 0
        }
    }
    
    @IBAction func buyBtnTapped(_ sender: UIButton) {
        delegate?.buyBtnTapped(in: self)
    }
    
}

