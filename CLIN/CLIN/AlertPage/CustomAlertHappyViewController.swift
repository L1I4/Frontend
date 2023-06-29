//
//  CustomAlertHappyViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/30.
//

import UIKit

class CustomAlertHappyViewController: UIViewController {
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        opaqueView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        alertView.layer.cornerRadius = 31
        okButton.layer.cornerRadius = 16
    }
    
    @IBAction func touchOkButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
