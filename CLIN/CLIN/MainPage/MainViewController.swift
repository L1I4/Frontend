//
//  MainViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/28.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var clincallButton: UIButton!
    @IBOutlet weak var smartTalkButton: UIButton!
    @IBOutlet weak var emojiButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    
    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var tableView1: UIView!
    @IBOutlet weak var tableView2: UIView!
    @IBOutlet weak var tableView3: UIView!
    @IBOutlet weak var tableView4: UIView!
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var exitView: UIView!
    @IBOutlet weak var adView: UIView!
    
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var callViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var clinCallLabel: UILabel!
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var checkView1: UIView!
    @IBOutlet weak var checkView2: UIView!
    @IBOutlet weak var checkView3: UIView!
    @IBOutlet weak var tableBoxView: UIView!
    
    @IBOutlet weak var checkCall1: UIButton!
    @IBOutlet weak var checkCall2: UIButton!
    @IBOutlet weak var checkCall3: UIButton!
    @IBOutlet weak var tableCall1: UIButton!
    @IBOutlet weak var tableCall2: UIButton!
    @IBOutlet weak var tableCall3: UIButton!
    @IBOutlet weak var tableCall4: UIButton!
    @IBOutlet weak var lastclinCallButton: UIButton!
    
    var checkCall: String = ""
    var tableCall: String = ""
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(1)
        // 로그인 대상자가 아니면
//        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainBeforeViewController")
//        vcName?.modalPresentationStyle = .fullScreen
//        self.present(vcName!, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        // 둥글게 둥글게
        clincallButton.layer.cornerRadius = 13
        smartTalkButton.layer.cornerRadius = 13
        emojiButton.layer.cornerRadius = 25
        foodButton.layer.cornerRadius = 25
        drinkButton.layer.cornerRadius = 25
        
        insideView.layer.cornerRadius = 41
        tableView1.layer.cornerRadius = 8
        tableView2.layer.cornerRadius = 8
        tableView3.layer.cornerRadius = 8
        tableView4.layer.cornerRadius = 8
        counterView.layer.cornerRadius = 8
        exitView.layer.cornerRadius = 8
        adView.layer.cornerRadius = 13
        
        callView.layer.cornerRadius = 41
        checkBoxView.layer.cornerRadius = 13
        checkView1.layer.cornerRadius = 15
        checkView2.layer.cornerRadius = 15
        checkView3.layer.cornerRadius = 15
        tableBoxView.layer.cornerRadius = 13
        tableCall1.layer.cornerRadius = 11
        tableCall2.layer.cornerRadius = 11
        tableCall3.layer.cornerRadius = 11
        tableCall4.layer.cornerRadius = 11
        lastclinCallButton.layer.cornerRadius = 13
        
        // 그림자 추가
        shadowSetting(emojiButton)
        shadowSetting(foodButton)
        shadowSetting(drinkButton)
        
        // 스마트톡 메뉴 숨기기
        if smartTalkButton.backgroundColor == UIColor.white {
            emojiButton.layer.isHidden = true
            foodButton.layer.isHidden = true
            drinkButton.layer.isHidden = true
        }
        
        // 임의로 선택된 테이블 (색상변경)
        tableView3.backgroundColor = UIColor(red: 0.15, green: 0.56, blue: 0.34, alpha: 1)
        
        // 텍스트 부분 글자 색 변경
        let attributedString = NSMutableAttributedString(string: clinCallLabel.text!)
        let range = (clinCallLabel.text! as NSString).range(of: "클린 콜")
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.15, green: 0.57, blue: 0.34, alpha: 1), range: range)
        clinCallLabel.attributedText = attributedString
    }
    
    // 그림자 추가 함수
    func shadowSetting(_ btn: UIButton) {
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.masksToBounds = false
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowRadius = 2
        btn.layer.shadowOpacity = 0.25
    }
    
    // 스마트톡 눌렀을 때 함수
    @IBAction func touchSmartTalkButton(_ sender: UIButton) {
        if smartTalkButton.backgroundColor == UIColor.white {
            smartTalkButton.backgroundColor = UIColor(red: 1, green: 0.84, blue: 0, alpha: 1)
            smartTalkButton.setImage(UIImage(named: "clarity_talk-bubbles-solid"), for: .normal)
            emojiButton.layer.isHidden =  false
            foodButton.layer.isHidden = false
            drinkButton.layer.isHidden = false
        } else {
            smartTalkButton.backgroundColor = UIColor.white
            smartTalkButton.setImage(UIImage(named: "clarity_talk-bubbles-solid_y"), for: .normal)
            emojiButton.layer.isHidden = true
            foodButton.layer.isHidden = true
            drinkButton.layer.isHidden = true
        }
        
    }
    
    // 클린콜 눌렀을 때 함수
    @IBAction func touchCleanCallButton(_ sender: UIButton) {
        if clincallButton.backgroundColor == UIColor.white {
            clincallButton.backgroundColor = UIColor(red: 0.03, green: 0.33, blue: 0.17, alpha: 1)
            clincallButton.tintColor = UIColor.white
            self.callViewBottomConstraint.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            clincallButton.backgroundColor = UIColor.white
            clincallButton.tintColor = UIColor.black
            self.callViewBottomConstraint.constant = -565
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            checkTrue()
            tableTrue()
            checkCall = ""
            tableCall = ""
        }
    }
    
    // 클린콜 안에서 요청사항 고르기
    @IBAction func touchCheckCallBtn(_ sender: UIButton) {
        checkTrue()
        sender.isSelected = true
    }
    
    // 클린콜 안에서 내 위치를 테이블 위치로 알려줄 때
    @IBAction func touchTableCallBtn(_ sender: UIButton) {
        tableTrue()
        sender.isSelected = true
        sender.backgroundColor = UIColor(red: 0.15, green: 0.57, blue: 0.34, alpha: 1)
        sender.tintColor = UIColor(red: 0.15, green: 0.57, blue: 0.34, alpha: 1)
        sender.titleLabel?.textColor = UIColor.white
    }
    
    func checkTrue() {
        if checkCall1.isSelected == true {
            checkCall1.isSelected = false
            checkCall1.setImage(UIImage(named: "non_check"), for: .normal)
            checkCall = "요청 1"
        } else if checkCall2.isSelected == true {
            checkCall2.isSelected = false
            checkCall2.setImage(UIImage(named: "non_check"), for: .normal)
            checkCall = "요청 2"
        } else {
            checkCall3.isSelected = false
            checkCall3.setImage(UIImage(named: "non_check"), for: .normal)
            checkCall = "요청 3"
        }
    }
    
    func tableTrue() {
        if tableCall1.isSelected == true {
            tableCall1.isSelected = false
            tableCall1.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall1.tintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall1.titleLabel?.textColor = UIColor.black
            tableCall = "테이블 1"
        } else if tableCall2.isSelected == true {
            tableCall2.isSelected = false
            tableCall2.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall2.tintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall2.titleLabel?.textColor = UIColor.black
            tableCall = "테이블 2"
        } else if tableCall3.isSelected == true{
            tableCall3.isSelected = false
            tableCall3.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall3.tintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall3.titleLabel?.textColor = UIColor.black
            tableCall = "테이블 3"
        } else {
            tableCall4.isSelected = false
            tableCall4.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall4.tintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
            tableCall4.titleLabel?.textColor = UIColor.black
            tableCall = "테이블 4"
        }
    }
    
    // 클린콜 부르기 눌렀을 때
    @IBAction func touchLastClinCall(_ sender: UIButton) {
        if checkCall == "" {
            print("again")
        } else if tableCall == "" {
            print("again")
        } else {
            checkTrue()
            tableTrue()
            
            print(checkCall)
            print(tableCall)
            
            clincallButton.backgroundColor = UIColor.white
            clincallButton.tintColor = UIColor.black
            self.callViewBottomConstraint.constant = -565
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            let storyboard = UIStoryboard(name: "CustomAlert", bundle: nil)
            let vcName = storyboard.instantiateViewController(withIdentifier: "CustomAlertViewController")
            vcName.modalPresentationStyle = .fullScreen
            self.present(vcName, animated: false, completion: nil)
        }
    }
}
