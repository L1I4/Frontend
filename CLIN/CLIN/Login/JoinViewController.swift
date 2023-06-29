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

    @IBAction func certificationBtnTap(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(identifier: "Certification") as? CertificateViewController
        nextVC!.modalPresentationStyle = .fullScreen
        self.present(nextVC!, animated: true)
    }

}
