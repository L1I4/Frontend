//
//  ClubListViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit
import Alamofire

class ClubListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var expandDataSource = ExpandingState()
    @IBOutlet weak var settingBtn: UIButton!
    let cellSpacingHeight: CGFloat = 30
    
    var clubListArray : ClubListResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        settingBtn.setTitle("", for: .normal)
        APIManager.gerClubList { result in
            switch result {
            case .success(let clubLists):
                self.clubListArray = clubLists
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print("Error : \(error)")
            }
        }
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
}

//테이블 뷰 관련 함수 extension
extension ClubListViewController: UITableViewDelegate, UITableViewDataSource{
    
    //section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return clubListArray?.count ?? 0
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
        
        APIManager.clubDetail(clubId: clubListArray![indexPath.section].clubID) { result in
            switch result{
            case .success(let info):
                var num = Int.random(in: 50 ... 170)
                guard let currentCell = tableView.cellForRow(at: indexPath) as? ClubListTableViewCell else {
                            return
                        }
                currentCell.capacityLabel.text = "\(num) / \(info.capacity)명"
                if Double(num) / Double(info.capacity) > 0.5{
                    currentCell.stateIcon.image = UIImage(named: "emoji_bad")
                    currentCell.stateLabel.text = "혼잡해요"
    
                }else{
                    currentCell.stateIcon.image = UIImage(named: "emoji_good")
                    currentCell.stateLabel.text = "쾌적해요"

                }
                var male = Int.random(in: 4 ... 7)
                var arr =  info.filePath.components(separatedBy: "/")
                var token = arr[4]
                var urlImage = "http://3.38.213.192/images/\(token)"
                let url = URL(string: urlImage)
                currentCell.clubNameLabel.text = info.clubName
                currentCell.endTimeLabel.text = info.closeTime
                currentCell.startTimeLabel.text = info.openTime
                currentCell.festivalLabel.text = info.description
                currentCell.priceLabel.text = "\(info.ticketPrice) ₩"
                currentCell.genderRateLabel.text =  "\(male) : \(10 - male) (남:여)"
                currentCell.djLabel.text = info.djName
//                currentCell.clubImg.load(url: url!)
                print("wehrkfhsdkjfhkdsjfsdfsd")
                print(url!)
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        content.is_expanded = !content.is_expanded
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClubListTableViewCell", for: indexPath) as! ClubListTableViewCell
        cell.settingData(tapped: expandDataSource)
        cell.delegate = self
        
        var arr =  clubListArray?[indexPath.section].filePath.components(separatedBy: "/")
        var token = arr![4]
        var urlImage = "http://3.38.213.192/images/\(token)"
        let url = URL(string: urlImage)!
    
        cell.clubId = indexPath.section + 1
        cell.endTimeLabel.text = clubListArray?[indexPath.section].closeTime
        cell.startTimeLabel.text = clubListArray?[indexPath.section].openTime
        cell.clubNameLabel.text = clubListArray?[indexPath.section].clubName
        cell.clubImg.load(url: url)
        let backGroundView = UIView()
        backGroundView.backgroundColor = .none
        cell.selectedBackgroundView = backGroundView
        
        return cell
    }
}

extension ClubListViewController: ClubListCellDelegate{
    func buyBtnTapped(in cell: ClubListTableViewCell) {
        
        
        let alert = UIAlertController(title: "", message: "\(cell.clubNameLabel.text!) 티켓을 구매하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default){_ in
            var param: Parameters = [:]
            param["userId"] = 1
            APIManager.buyTicket(clubId: cell.clubId!, param: param)
            let confirmAlert = UIAlertController(title: "", message: "\(cell.clubNameLabel.text!) 티켓 구매가 완료되었습니다.", preferredStyle: .alert)
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
