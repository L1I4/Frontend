//
//  ExtensionTextField.swift
//  CLIN
//
//  Created by YoonSub Lim on 2023/06/29.
//

import Foundation
import UIKit

extension UITextField {
    
    // 텍스트 필드 왼쪽 여백
    func addLeftPadding(amount:Float) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(amount), height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }

    // 텍스트 필드 글자 간격 조정
    func addTextSpacing(amount:Float){
        self.defaultTextAttributes.updateValue(amount, forKey: NSAttributedString.Key.kern)
    }
    
    
    func changePhoneNumberFormat(){
        // 폰 번호 포맷으로 변형
        self.text = format(with: "XXX-XXXX-XXXX", phone: self.text!)
    }
    
    
    // 번호 포맷 변경
    /// mask example: `+X (XXX) XXX-XXXX`
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }

}
