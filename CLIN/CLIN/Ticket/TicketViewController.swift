//
//  TicketViewController.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import UIKit

class TicketViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var advertiseImg: UIImageView!
    
    @IBOutlet weak var advertiseTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var adHeight: NSLayoutConstraint!
    
    var ticketArray:TicketResponse?
    
    var ticketImg :UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ticket")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.layer.borderColor = UIColor.black.cgColor
        img.layer.borderWidth = 0.2
        img.layer.shadowColor = UIColor.black.cgColor
        img.layer.masksToBounds = false
        img.layer.shadowRadius = 10
        img.layer.shadowOpacity = 0.5
        return img
    }()
    
    let ticketBottomView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        var ticketdate = "2022-11-11" //테스트용 임시 변수
        label.font = .systemFont(ofSize: 10)
        label.text = "구매일시| \(ticketdate)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let confirmLabel : UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "입장 완료"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let confirmLabel2 : UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.font = .boldSystemFont(ofSize: 10)
        label.text = "입장 확인이 완료되었습니다!"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 38/255, green: 144/255, blue: 87/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        APIManager.readTicket(userId: 1) { result in
            print(result)
            switch result{
            case .success(let ticketList):
                self.ticketArray = ticketList
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension TicketViewController: UITableViewDelegate, UITableViewDataSource{
    //section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return ticketArray?.count ?? 0
    }
    
    //section 당 row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketTableViewCell", for: indexPath) as! TicketTableViewCell
        cell.delegate = self
        cell.clubId = ticketArray![indexPath.section].clubID
        cell.dateLabel.text = "\(ticketArray![indexPath.section].generatedDate[0])-\(ticketArray![indexPath.section].generatedDate[1])-\(ticketArray![indexPath.section].generatedDate[2])"
        cell.clubNameLabel.text = ticketArray![indexPath.section].clubName
        return cell
    }
}



//입장 확인 버튼 누르면 동작
extension TicketViewController: TicketCellDelegate{
    func setupUI(){
        self.tableView.isHidden = true
        adHeight.constant = 60
        ticketBottomView.addSubview(dateLabel)
        ticketBottomView.addSubview(confirmLabel)
        
        NSLayoutConstraint.activate([
            ticketBottomView.heightAnchor.constraint(equalToConstant: 100),
            ticketBottomView.widthAnchor.constraint(equalToConstant: 300),
            
            dateLabel.leadingAnchor.constraint(equalTo:  ticketBottomView.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: ticketBottomView.topAnchor, constant: 10),
           
           confirmLabel.bottomAnchor.constraint(equalTo:  ticketBottomView.bottomAnchor, constant: -10),
           confirmLabel.centerXAnchor.constraint(equalTo: ticketBottomView.centerXAnchor, constant: 0)
        ])
        
    
        self.view.addSubview(ticketImg)
        self.view.addSubview(ticketBottomView)
        self.view.addSubview(confirmLabel2)
        
        ticketImg.alpha = 0.0
        ticketBottomView.alpha = 0.0
        confirmLabel2.alpha = 0.0

        
        advertiseTopConstraint.constant = 20
        advertiseImg.image = UIImage(named: "ticketConfirm")
        NSLayoutConstraint.activate([
            ticketImg.heightAnchor.constraint(equalToConstant: 370),
            ticketImg.widthAnchor.constraint(equalToConstant: 300),
            ticketImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            ticketImg.topAnchor.constraint(equalTo:  view.topAnchor, constant: 200),
            
            ticketBottomView.heightAnchor.constraint(equalToConstant: 100),
            ticketBottomView.widthAnchor.constraint(equalToConstant: 300),
            ticketBottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            ticketBottomView.topAnchor.constraint(equalTo:  ticketImg.bottomAnchor, constant: 0),
            
            confirmLabel2.bottomAnchor.constraint(equalTo:  ticketImg.topAnchor, constant: -10),
            confirmLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        ])
        UIView.animate(withDuration: 0.8) {
            self.ticketImg.alpha = 1.0
            self.ticketBottomView.alpha = 1.0
            self.confirmLabel2.alpha = 1.0
        }
    }
    
    
    func confirmBtnTapped(in cell: TicketTableViewCell) {
        
        let alert = UIAlertController(title: "알림", message: "사용 확인 시 복구가 불가능합니다.\n쿠폰 사용 확인을 하는 직원이 맞습니까?", preferredStyle: .alert)
        //확인을 누르면 오토 레이아웃 수정
        let ok = UIAlertAction(title: "확인", style: .destructive){_ in
            self.setupUI()
            APIManager.userState(clubId: cell.clubId! , userId: 1) { result in
                print("")
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
}
