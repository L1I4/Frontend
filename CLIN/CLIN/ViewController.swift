//
//  ViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var nextToPwBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldInit()
        nextToBtnInit()
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
    
    func nextToBtnInit(){
        // 기능 정지
        nextToPwBtn.isEnabled = false
                
        // 버튼 색상 초기화
        nextToPwBtn.layer.backgroundColor = UIColor.lightGray.cgColor
        
        nextToPwBtn.layer.cornerRadius = 10
    }
        
    // 폰 번호 입력시 테두리 색 조정
    @objc func textFieldDidChange(textField: UITextField){
        if textField.text!.count < 13{
            textField.layer.borderColor = UIColor.red.cgColor
            nextToPwBtn.layer.backgroundColor = UIColor.lightGray.cgColor
            nextToPwBtn.isEnabled = false
            nextToPwBtn.tintColor = UIColor.black
        }else{
            textField.layer.borderColor = UIColor.blue.cgColor
            nextToPwBtn.layer.backgroundColor = UIColor.blue.cgColor
            nextToPwBtn.isEnabled = true
            nextToPwBtn.tintColor = UIColor.white
        }
        textField.changePhoneNumberFormat()
    }
    

}
