//
//  ViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ID / PW 기본 스타일 지정
        idTextField.layer.borderWidth = 0.5
        idTextField.layer.cornerRadius = 5
        idTextField.layer.borderColor = UIColor.red.cgColor
        
        pwTextField.layer.borderWidth = 0.5
        pwTextField.layer.cornerRadius = 5
        pwTextField.layer.borderColor = UIColor.red.cgColor
        
        // ID / PW 입력시 테두리 색 조정 타겟 추가
        idTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: .editingChanged)
        
    }
    
    // ID / PW 입력시 테두리 색 조정
    @objc func textFieldDidChange(textField: UITextField){
        if textField.text == ""{
            textField.layer.borderColor = UIColor.red.cgColor
        }else{
            textField.layer.borderColor = UIColor.blue.cgColor
        }
    }

    @IBAction func loginBtnTap(_ sender: Any) {
        // Login API 호출
        // Login 화면 dismiss 후 Home 화면 이동
    }
    
    @IBAction func joinBtnTap(_ sender: Any) {
        // Join 화면 이동
    }

}

