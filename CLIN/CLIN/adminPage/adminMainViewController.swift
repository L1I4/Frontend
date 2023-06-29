//
//  adminMainViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/29.
//

import UIKit

class adminMainViewController: UIViewController {
   
    @IBOutlet weak var clinNoticeButton: UIButton!
    @IBOutlet weak var callHistoryButton: UIButton!
    
    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var tableButton1: UIButton!
    @IBOutlet weak var tableButton2: UIButton!
    @IBOutlet weak var tableButton3: UIButton!
    @IBOutlet weak var tableButton4: UIButton!
    
    @IBOutlet weak var menuButton1: UIButton!
    @IBOutlet weak var menuButton2: UIButton!
    @IBOutlet weak var menuButton3: UIButton!
    
    @IBOutlet weak var tableBoxView: UIView!
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var exitView: UIView!
    @IBOutlet weak var adView: UIView!
    
    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var noticeViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var checkView1: UIView!
    @IBOutlet weak var checkView2: UIView!
    @IBOutlet weak var checkView3: UIView!
    
    @IBOutlet weak var checkNotice1: UIButton!
    @IBOutlet weak var checkNotice2: UIButton!
    @IBOutlet weak var checkNotice3: UIButton!
    
    @IBOutlet weak var noticeButton: UIButton!
    
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyBoxView: UIView!
    @IBOutlet weak var historyViewBottomConstraint: NSLayoutConstraint!
    
    var checkNotice: String = ""
    
    override func viewDidLoad() {
        clinNoticeButton.layer.cornerRadius = 13
        callHistoryButton.layer.cornerRadius = 13
        
        insideView.layer.cornerRadius = 32
        tableButton1.layer.cornerRadius = 8
        tableButton2.layer.cornerRadius = 8
        tableButton3.layer.cornerRadius = 8
        tableButton4.layer.cornerRadius = 8
        
        menuButton1.layer.cornerRadius = 25
        menuButton2.layer.cornerRadius = 25
        menuButton3.layer.cornerRadius = 25
        
        tableBoxView.layer.cornerRadius = 13
        counterView.layer.cornerRadius = 8
        exitView.layer.cornerRadius = 8
        adView.layer.cornerRadius = 13
        
        checkBoxView.layer.cornerRadius = 13
        checkView1.layer.cornerRadius = 15
        checkView2.layer.cornerRadius = 15
        checkView3.layer.cornerRadius = 15
        noticeButton.layer.cornerRadius = 13
        
        historyView.layer.cornerRadius = 32
        historyBoxView.layer.cornerRadius = 8
        
        tableButton4.backgroundColor = UIColor(red: 0.62, green: 0, blue: 0, alpha: 1)
        tableButton4.tintColor = UIColor.white
    }
    
    @IBAction func touchTableButton(_ sender:UIButton) {
        if sender.backgroundColor == UIColor(red: 0.62, green: 0, blue: 0, alpha: 1) {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "adminMainModalViewController") as? adminMainModalViewController else { return }
            self.present(nextVC, animated: true, completion: nil)
            sender.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
            sender.tintColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        }
    }
    
    @IBAction func touchClinNoticeButton(_ sender: UIButton) {
        if clinNoticeButton.backgroundColor == UIColor.white {
            clinNoticeButton.backgroundColor = UIColor(red: 0.03, green: 0.33, blue: 0.17, alpha: 1)
            clinNoticeButton.tintColor = UIColor.white
            self.noticeViewBottomConstraint.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            clinNoticeButton.backgroundColor = UIColor.white
            clinNoticeButton.tintColor = UIColor.black
            self.noticeViewBottomConstraint.constant = -591
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            checkTrue()
            checkNotice = ""
        }
    }
    
    @IBAction func touchCallHistoryButton(_ sender:UIButton) {
        if callHistoryButton.backgroundColor == UIColor.white {
            callHistoryButton.backgroundColor = UIColor(red: 0.32, green: 0, blue: 0.57, alpha: 1)
            callHistoryButton.tintColor = UIColor.white
            callHistoryButton.setImage(UIImage(named: "ic_round-history 1"), for: .normal)
            self.historyViewBottomConstraint.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            callHistoryButton.backgroundColor = UIColor.white
            callHistoryButton.tintColor = UIColor.black
            callHistoryButton.setImage(UIImage(named: "ic_round-history"), for: .normal)
            self.historyViewBottomConstraint.constant = -591
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func checkTrue() {
        if checkNotice1.isSelected == true {
            checkNotice1.isSelected = false
            checkNotice1.setImage(UIImage(named: "non_check"), for: .normal)
            checkNotice = "요청 1"
        } else if checkNotice2.isSelected == true {
            checkNotice2.isSelected = false
            checkNotice2.setImage(UIImage(named: "non_check"), for: .normal)
            checkNotice = "요청 2"
        } else {
            checkNotice3.isSelected = false
            checkNotice3.setImage(UIImage(named: "non_check"), for: .normal)
            checkNotice = "요청 3"
        }
    }
    
    @IBAction func touchCheckNoticeBtn(_ sender: UIButton) {
        checkTrue()
        sender.isSelected = true
    }
    
    @IBAction func touchLastClinNotice(_ sender: UIButton) {
        if checkNotice == "" {
            print("again")
        } else {
            checkTrue()
            
            print(checkNotice)
            
            clinNoticeButton.backgroundColor = UIColor.white
            clinNoticeButton.tintColor = UIColor.black
            self.noticeViewBottomConstraint.constant = -591
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            let storyboard = UIStoryboard(name: "CustomAlert", bundle: nil)
            let vcName = storyboard.instantiateViewController(withIdentifier: "CustomAlertCheckViewController")
            vcName.modalPresentationStyle = .fullScreen
            self.present(vcName, animated: false, completion: nil)
        }
    }
}
