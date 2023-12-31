//
//  EnterPwViewController.swift
//  CLIN
//
//  Created by YoonSub Lim on 2023/06/29.
//

import UIKit

class EnterPwViewController: UIViewController {
    
    @IBOutlet var pwCircles: [UIView]!
    var phoneNumber: String = "" // 입력 전화번호
    var username: String = "" // 입력 이름
    
    let dummyTextField = UITextField()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        pwCircleInit(pwCircles: pwCircles)
        pwInit()
        
        print(phoneNumber)
    }
    
}

extension EnterPwViewController: UITextFieldDelegate{

    func pwCircleInit(pwCircles: [UIView]!){
        for c in pwCircles {
            // Circular view
            c.layer.cornerRadius = c.layer.bounds.width / 2
            c.clipsToBounds = true
            c.layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }

    // UITextFieldDelegate 메서드 - 텍스트 변경 시 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 텍스트가 변경될 때마다 호출되는 로직을 작성합니다.

        // 변경 전 텍스트
        let oldText = textField.text ?? ""

        // 변경된 텍스트
        let newText = (oldText as NSString).replacingCharacters(in: range, with: string)

        if newText.count < 6{
            let old_idx = oldText.count
            let new_idx = newText.count

            if old_idx < new_idx{
                pwCircles[new_idx-1].layer.backgroundColor = UIColor(red: 72.0/255.0, green: 142.0/255.0, blue: 92.0/255.0, alpha: 1.0).cgColor
            }else if old_idx > new_idx{
                pwCircles[new_idx].layer.backgroundColor = UIColor.lightGray.cgColor
            }
        }else if newText.count == 6{

            if let nextVC = self.storyboard?.instantiateViewController(identifier: "ReenterPw") as? ReenterPwViewController {
                
                nextVC.username = username
                nextVC.password = newText
                nextVC.phoneNumber = phoneNumber
                
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true)
            }

        }

        // true를 반환하면 변경된 텍스트가 UITextField에 반영됩니다.
        return true
    }

    func pwInit(){
        view.addSubview(dummyTextField)
        dummyTextField.keyboardType = .numberPad
        dummyTextField.becomeFirstResponder() // 키보드를 표시

        dummyTextField.delegate = self
    }
}
