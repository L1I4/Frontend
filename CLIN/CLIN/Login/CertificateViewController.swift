//
//  CertificateViewController.swift
//  CLIN
//
//  Created by YoonSub Lim on 2023/06/29.
//

import UIKit

class CertificateViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passCertificationImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(nameTextField)
        self.view.addSubview(phoneNumberTextField)    }

    @IBAction func enterPwBtnTap(_ sender: Any) {
        print("회원가입_본인인증 창에서 비밀번호 입력 창으로 넘어가는 버튼 클릭")
        print("nameTextField : \(nameTextField.text!)")
        print("phoneNumberTextField : \(phoneNumberTextField.text!)")
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "EnterPw") as? EnterPwViewController
        nextVC!.username = nameTextField.text!
        nextVC!.phoneNumber = phoneNumberTextField.text!
        nextVC!.modalPresentationStyle = .fullScreen
        self.present(nextVC!, animated: true)
    }

}
