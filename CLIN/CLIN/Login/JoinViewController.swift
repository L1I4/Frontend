//
//  JoinViewController.swift
//  CLIN
//
//  Created by YoonSub Lim on 2023/06/29.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet weak var certificationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        certificationBtn.layer.cornerRadius = 10
        certificationBtn.layer.backgroundColor = UIColor(red: 72.0/255.0, green: 142.0/255.0, blue: 92.0/255.0, alpha: 1.0).cgColor
    }

    @IBAction func certificationBtnTap(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(identifier: "Certification") as? CertificateViewController
        nextVC!.modalPresentationStyle = .fullScreen
        self.present(nextVC!, animated: true)
    }

}
