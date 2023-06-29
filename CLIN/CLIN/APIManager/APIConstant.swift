//
//  APIConstant.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation

struct APIConstant{
    static let baseURL = "http://3.38.213.192:8081"
    
    //회원가입
    static let signUp = baseURL + "/signup"
    //로그인
    static let login = baseURL + "/login"
    
    //전체 클럽 리스트 조회
    static let clubList = baseURL + "/clubs"
    
    //클럽 상세 조회 ( 원본 URL: /clubs/{clubId} )
    static let clubDetail = baseURL + "/clubs/%d"
    
    //클럽 테이블 전체 리스트 조회 ( 원본 URL: /clubs/{clubId}/tables )
    static let tables = baseURL + "/clubs/%d/tables"
    
    //유저가 MD에게 신고 ( 원본 URL: /warning/clubs/{clubId}/tables/{tableNo} )
    static let report = baseURL + "/warning/clubs/%d/tables/%d"
    
    //MD가 유저들에게 전체 경고 (원본 URL: /warning/clubs/{clubId})
    static let warning = baseURL + "warning/clubs/%d"
    
    //유저 클럽 입장/퇴장     /clubs/{clubId}/users/{userId}/states
    static let userState = baseURL + "/clubs/%d/users/%d/states"
    
    //유저 티켓 구매        /clubs/{clubId}/tickets
    static let buyTicket = baseURL + "/clubs/%d/tickets"
    
    //테이블 상태 메세지 등록 /clubs/{clubId}/tables/{tableId}/messages
    static let message = baseURL + "/clubs/%d/tables/%d/messages"
    
    //유저 전체 티켓 조회    /users/{userId}/tickets
    static let readTicket = baseURL + "/users/%d/tickets"
    
    //유저 권한 변경       /users/{userId}
    static let changeUserAuth = baseURL + "/users/%d"
    
    //클럽내 MD에게 온 신고 조회  /warning/clubs/{clubId}
    static let mdObserver = baseURL + "warning/clubs/%d"
    
    //클럽 내 안전 상태 확인     /clubs/{clubId}/safeties
    static let clientObserver = baseURL + "/clubs/%d/safeties"
    
    
    //%d 입력해야하는 URL 변환 예시
    //let endpoint = String(format: APIConstant.clientObserver, 1)  //1이 userID일때
    //let endpoint = String(format: APIConstant.message, 1, 2) // 1번 클럽 2번 테이블일때

}

//URL 인코딩을 위한 String extension
extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
}
