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

    @IBOutlet weak var expandView: UIView!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var downArrowImg: UIImageView!
    
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
            self.infoBtn.titleLabel?.text = "클린 정보"
            self.infoBtn.titleLabel?.textAlignment = .center
            self.downArrowImg.isHidden = true
            self.expandView.isHidden = false
            self.expandView.alpha = 1
            
        }
        else
        {
            self.infoBtn.titleLabel?.text = "클린 정보 더보기"
            self.infoBtn.titleLabel?.textAlignment = .center
            self.downArrowImg.isHidden = false
            self.expandView.isHidden = true
            self.expandView.alpha = 0
        }
    }
    
    @IBAction func buyBtnTapped(_ sender: UIButton) {
        delegate?.buyBtnTapped(in: self)
    }
    
}
