//
//  RequestTImer.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/30.
//
import UIKit

class TimerManager{
    static let shared = TimerManager()
    
    private var timer: Timer?
    
    private init() {}
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timerHandler), userInfo: nil, repeats: true)
    }
    
    @objc private func timerHandler() {
        print("요청함")
        APIManager.confirmSafety(clubId: 1) { result in
            switch result{
            case .success(let res):
                if res.safety == "SAFE" {return}
                //위험한 경우
                else{
                    self.stopTimer()

                }
            case .failure(_):
                print("안전 확인 요청 실패")
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
