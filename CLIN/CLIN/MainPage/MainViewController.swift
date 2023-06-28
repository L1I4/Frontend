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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        shadowSetting(emojiButton)
        shadowSetting(foodButton)
        shadowSetting(drinkButton)
        
        if smartTalkButton.backgroundColor == UIColor.white {
            emojiButton.layer.isHidden = true
            foodButton.layer.isHidden = true
            drinkButton.layer.isHidden = true
        }
        
        tableView3.backgroundColor = UIColor(red: 0.15, green: 0.56, blue: 0.34, alpha: 1)
        
        let attributedString = NSMutableAttributedString(string: clinCallLabel.text!)
        let range = (clinCallLabel.text! as NSString).range(of: "클린 콜")
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.15, green: 0.57, blue: 0.34, alpha: 1), range: range)
        clinCallLabel.attributedText = attributedString
    }
    
    func shadowSetting(_ btn: UIButton) {
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.masksToBounds = false
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowRadius = 2
        btn.layer.shadowOpacity = 0.25
    }
    
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
        }
        
    }
}
