//
//  CustomAlertViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/29.
//

import UIKit

protocol CustomAlertDelegate {
    func exit()
}

extension CustomAlertDelegate where Self: UIViewController {
    func show(
        alertText: String,
        cancelButtonText: String? = "",
        confirmButtonText: String
    ) {
        let customAlertStoryboard = UIStoryboard(name: "CustomAlertViewController", bundle: nil)
        let customAlertViewController = customAlertStoryboard.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        
        customAlertViewController.delegate = self
        
        customAlertViewController.modalPresentationStyle = .overFullScreen
        customAlertViewController.modalTransitionStyle = .crossDissolve
        customAlertViewController.alertText = alertText
        customAlertViewController.cancelButtonText = cancelButtonText ?? ""
        customAlertViewController.confirmButtonText = confirmButtonText
        
        self.present(customAlertViewController, animated: true, completion: nil)
    }
}

class CustomAlertViewController: UIViewController {
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    var alertText = ""
    var cancelButtonText = ""
    var confirmButtonText = ""
    
    var delegate: CustomAlertDelegate?
    
    override func viewDidLoad() {
        opaqueView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        confirmButton.isHidden = false
        confirmButton.setTitle(confirmButtonText, for: .normal)
        confirmButton.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 1).isActive = true
    }
    
    @IBAction func touchOkButton(_ sender:UIButton) {
        self.dismiss(animated: true){
            self.delegate?.exit()
        }
    }
    
    
}
