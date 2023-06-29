//
//  JoinViewController.swift
//  CLIN
//
//  Created by YoonSub Lim on 2023/06/29.
//

import UIKit

class JoinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    @IBAction func certificationBtnTap(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(identifier: "Certification") as? JoinViewController
        nextVC!.modalPresentationStyle = .fullScreen
        self.present(nextVC!, animated: true)
    }

    @IBAction func enterPwBtnTap(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "EnterPw") as? EnterPwViewController
        nextVC!.username = nameTextField.text!
        nextVC!.phoneNumber = phoneNumberTextField.text!
        nextVC!.modalPresentationStyle = .fullScreen
        self.present(nextVC!, animated: true)
    }


}
