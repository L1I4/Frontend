//
//  PwViewController.swift
//  CLIN
//
//  Created by YoonSub Lim on 2023/06/29.
//

import UIKit
import Alamofire

class PwViewController: UIViewController{
    
    @IBOutlet var pwCircles: [UIView]!
    @IBOutlet weak var pwDescription: UILabel!
    
    var phoneNumber:String = ""
        
    let dummyTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        pwCircleInit(pwCircles: pwCircles)
        pwInit()
    }
    
}

extension PwViewController: UITextFieldDelegate{
    
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
        
        print(newText)
        
        if newText.count < 6{
            let old_idx = oldText.count
            let new_idx = newText.count
            
            if old_idx < new_idx{
                pwCircles[new_idx-1].layer.backgroundColor =
                UIColor(red: 72.0/255.0, green: 142.0/255.0, blue: 92.0/255.0, alpha: 1.0).cgColor
            }else if old_idx > new_idx{
                pwCircles[new_idx].layer.backgroundColor = UIColor.lightGray.cgColor
            }
        }else if newText.count == 6{
            
            let loginParam: Parameters = [
                "phoneNumber": phoneNumber,
                "password": newText
            ]
            print("@@@")
            
            APIManager.login(param: loginParam, completion: { result in
                switch result {
                case .success(let response):
                    // 로그인 요청 성공
                    print("로그인 성공")
                    
                    // userID local DB 저장
                    print(response.userID)
                    UserDefaults.standard.set(response.userID, forKey: "userID")
                    
                    // tabBarController 로 전환.
                    let storyboard = UIStoryboard(name: "ViewManager", bundle: nil)
                    let tabBarController = storyboard.instantiateViewController(withIdentifier: "start")
                    
                    tabBarController.modalPresentationStyle = .fullScreen
                    self.present(tabBarController, animated: true)

                case .failure(let error):
                    // 로그인 요청 실패
                    print("로그인 실패: \(error)")
                    
                    // 로그인 입력 필드 비우기
                    textField.text = ""
                    
                    // 로그인 입력 뷰 색 변경
                    for c in self.pwCircles{
                        c.layer.backgroundColor = UIColor.lightGray.cgColor
                    }

                    // 색 & 텍스트 변경
                    UIView.animate(withDuration: 1){
                        self.pwDescription.text = "비밀번호를 다시 입력해주세요"
                        self.pwDescription.textColor = .red
                    }
                    
                }
            })
            
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
