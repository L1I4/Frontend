//
//  ViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldInit()
    }
    
//    @IBAction func loginBtnTap(_ sender: Any) {
//        // Login API 호출
//
//        // Login 화면 dismiss 후 Home 화면 이동
//
//    }
//
//    @IBAction func joinBtnTap(_ sender: Any) {
//        // Join 화면 이동
//    }

}

extension ViewController{
    
    func textFieldInit(){
        // ID / PW 기본 스타일 지정
        phoneNumberTextField.layer.cornerRadius = 10
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.borderColor = UIColor.red.cgColor
        phoneNumberTextField.addLeftPadding(amount: 20)
        phoneNumberTextField.addTextSpacing(amount: 2)
        
        // 폰 번호 입력시 테두리 색 조정 타겟 추가
        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: .editingChanged)
    }
    
    // 폰 번호 입력시 테두리 색 조정
    @objc func textFieldDidChange(textField: UITextField){
        if textField.text!.count < 13{
            textField.layer.borderColor = UIColor.red.cgColor
        }else{
            textField.layer.borderColor = UIColor.blue.cgColor
        }
        textField.changePhoneNumberFormat()
    }
    

}
