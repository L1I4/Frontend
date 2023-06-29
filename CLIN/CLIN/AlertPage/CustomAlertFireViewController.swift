//
//  CustomAlertFireViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/29.
//

import UIKit

class CustomAlertFireViewController: UIViewController {
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        opaqueView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        alertView.layer.cornerRadius = 31
        okButton.layer.cornerRadius = 19
    }
    
    @IBAction func touchOkButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
