//
//  CustomAlertTicketViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/30.
//

import UIKit

class CustomAlertTicketViewController: UIViewController {
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        opaqueView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        alertView.layer.cornerRadius = 31
        okButton.layer.cornerRadius = 16
        noButton.layer.cornerRadius = 16
    }
    
    @IBAction func touchOKButton(_ sender: UIButton) {
        guard let pvc = self.presentingViewController else { return }
    
        let vcName = storyboard?.instantiateViewController(withIdentifier: "CustomAlertNoticeViewController")
        vcName!.modalPresentationStyle = .fullScreen
        
        self.dismiss(animated: true) {
            pvc.present(vcName!, animated: true, completion: nil)
        }
    }
    
    @IBAction func touchNoButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
