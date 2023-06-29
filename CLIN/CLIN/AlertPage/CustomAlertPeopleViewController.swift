//
//  CustomAlertPeopleViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/29.
//

import UIKit

class CustomAlertPeopleViewController: UIViewController {
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        opaqueView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        alertView.layer.cornerRadius = 31
        okButton.layer.cornerRadius = 19
        
        let attributedString = NSMutableAttributedString(string: contentsLabel.text!)
        let range = (contentsLabel.text! as NSString).range(of: "통행로 상황이 많이 혼잡")
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        contentsLabel.attributedText = attributedString
    }
    
    @IBAction func touchOkButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
