//
//  ClubListViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit

class ClubListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var expandDataSource = ExpandingState()
    @IBOutlet weak var settingBtn: UIButton!
    let cellSpacingHeight: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        settingBtn.setTitle("", for: .normal)
        
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}

//테이블 뷰 관련 함수 extension
extension ClubListViewController: UITableViewDelegate, UITableViewDataSource{
    
    //section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //section 당 row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = expandDataSource
        
        content.is_expanded = !content.is_expanded
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClubListTableViewCell", for: indexPath) as! ClubListTableViewCell
        cell.settingData(tapped: expandDataSource)
        cell.delegate = self
        let backGroundView = UIView()
        backGroundView.backgroundColor = .none
        cell.selectedBackgroundView = backGroundView
        
        return cell
    }
}

extension ClubListViewController: ClubListCellDelegate{
    func buyBtnTapped(in cell: ClubListTableViewCell) {
        
        var clubname = "L1M4 CLUB"
        let alert = UIAlertController(title: "", message: "\(clubname) 티켓을 구매하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default){_ in
            let confirmAlert = UIAlertController(title: "", message: "\(clubname) 티켓 구매가 완료되었습니다.", preferredStyle: .alert)
            let confirm = UIAlertAction(title: "확인", style: .default)
            confirmAlert.addAction(confirm)
            self.present(confirmAlert, animated: true)
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    
}
