//
//  TicketViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit

class TicketViewController: UIViewController {

    
    @IBOutlet weak var advertiseImg: UIImageView!
    @IBOutlet weak var stackViewBottomAnchor: NSLayoutConstraint?
    
    @IBOutlet weak var advertiseTopAnchor: NSLayoutConstraint!
    //"입장 확인이 완료되었습니다" 메세지
    @IBOutlet weak var ConfirmMsg: UILabel!
    
    //티켓을 표시하는 스택 뷰
    @IBOutlet weak var stackView: UIStackView!
    
    //하단의 초록색 view
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfirmMsg.isHidden = true
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 0.3
        
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.masksToBounds = false
        stackView.layer.shadowRadius = 10
        stackView.layer.shadowOpacity = 0.5
        
        bottomView.layer.cornerRadius = 8
        bottomView.layer.borderWidth = 0.3
        
        
    }
    
    
    //입장 확인 버튼을 누르면 작동하는 함수
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "알림", message: "사용 확인 시 복구가 불가능합니다.\n쿠폰 사용 확인을 하는 직원이 맞습니까?", preferredStyle: .alert)
        //확인을 누르면 오토 레이아웃 수정
        let ok = UIAlertAction(title: "확인", style: .destructive){ _ in
            self.bottomView.isHidden = true
            self.advertiseImg.image = UIImage(named: "ticketConfirm")
            self.ConfirmMsg.isHidden = false
            UIView.animateKeyframes(withDuration: 1, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    self.advertiseTopAnchor?.constant = 80
                    self.stackViewBottomAnchor?.constant = 80
                    self.view.layoutIfNeeded()
                })
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    
    }
    
}
