//
//  adminMainModalViewController.swift
//  CLIN
//
//  Created by Mjolnir on 2023/06/29.
//

import UIKit

class adminMainModalViewController: UIViewController {
    @IBOutlet weak var callContentView: UIView!
    @IBOutlet weak var callContentLabel: UILabel!
    
    @IBOutlet weak var tableBoxView: UIView!
    @IBOutlet weak var tableButton1: UIButton!
    @IBOutlet weak var tableButton2: UIButton!
    @IBOutlet weak var tableButton3: UIButton!
    @IBOutlet weak var tableButton4: UIButton!
    
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var exitView: UIView!
    
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var successButton: UIButton!
    
    override func viewDidLoad() {
        
        tableButton1.layer.cornerRadius = 8
        tableButton2.layer.cornerRadius = 8
        tableButton3.layer.cornerRadius = 8
        tableButton4.layer.cornerRadius = 8
        
        tableBoxView.layer.cornerRadius = 13
        counterView.layer.cornerRadius = 8
        exitView.layer.cornerRadius = 8
        
        reportButton.layer.cornerRadius = 8
        successButton.layer.cornerRadius = 8
    }
    
    @IBAction func touchSuccessButton(_ sender: UIButton) {
        guard let pvc = self.presentingViewController else { return }

        let storyboard = UIStoryboard(name: "CustomAlert", bundle: nil)
        let vcName = storyboard.instantiateViewController(withIdentifier: "CustomAlertSuccessViewController")
        vcName.modalPresentationStyle = .fullScreen
        
        self.dismiss(animated: true) {
            pvc.present(vcName, animated: true, completion: nil)
        }
    }
    
}
