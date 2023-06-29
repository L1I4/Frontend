//
//  apiManager.swift
//  CLIN
//
//  Created by 이동현 on 2023/06/29.
//

import Foundation
import Alamofire

class APIManager{
    
    //완료 핸들러는 수정예정
    
    //회원 가입 요청
    static func signUp(param: Parameters, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = APIConstant.signUp
        
        AF.request(endpoint,
                   method: .post,
                   parameters: param,
                   encoding: JSONEncoding.default)
        .response{ response in
            if let status = response.response?.statusCode {
                if status == 200{
                    print("회원가입 요청 성공 (응답코드 \(status))")
                }else{
                    print("회원가입 요청 실패")
                }
            }
        }
        
    }
    
    //로그인 요청
    static func login(param: Parameters, completion: @escaping (Result<LoginResponse, Error>) -> Void){
        let endpoint = APIConstant.login
        
        AF.request(endpoint, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: LoginResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("로그인 요청 성공")
                //completion에서 userId userDefault에 저장해야함!!!!
                completion(.success(res))
            case .failure(_):
                print("로그인 요청 실패")
                //completion(.failure(error))
            }
        })
    }
    
    //전체 클럽 리스트 조회 요청
    static func readPost(completion: @escaping (Result<ClubListResponse, Error>) -> Void){
        let endpoint = APIConstant.clubList

        AF.request(endpoint, method: .get).responseDecodable(of: ClubListResponse.self) { response in
            switch response.result{
            case .success(let res):
                print("클럽 리스트 조회 성공")
                //완료 핸들러에서 클럽 리스트 처리
                completion(.success(res))
            case .failure(_):
                print("클럽 리스트 조회 실패")
                //completion(.failure(error))
            }
        }
    }
    
    //클럽 상세 조회 요청
    static func clubDetail(clubId: Int, completion: @escaping (Result<ClubInfoResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.clubDetail, clubId)

        AF.request(endpoint, method: .get).responseDecodable(of: ClubInfoResponse.self) { response in
            switch response.result{
            case .success(let res):
                print("클럽 상세 조회 성공")
                //완료 핸들러에서 조회한 클럽 정보를 처리함
                completion(.success(res))
            case .failure(_):
                print("클럽 상세 조회 실패")
                //completion(.failure(error))
            }
        }
    }

    //클럽 테이블 전체 리스트 조회 요청
    static func getTable(clubId: Int, completion: @escaping (Result<TableStatusInfoResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.tables, clubId)

        AF.request(endpoint, method: .get).responseDecodable(of: TableStatusInfoResponse.self) { response in
            switch response.result{
            case .success(let res):
                print("클럽 테이블 조회 성공")
                //완료 핸들러에서 조회한 테이블 정보들 처리
                completion(.success(res))
            case .failure(_):
                print("클럽 테이블 조회 실패")
                //completion(.failure(error))
            }
        }
    }
    
    //유저가 MD에게 신고 요청
    static func report(clubId:Int, tableNo: Int, param: Parameters, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.report, clubId, tableNo)
        
        AF.request(endpoint, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: BlankResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("신고 요청 성공")
                completion(.success(res))
            case .failure(_):
                print("신고 요청 실패")
                //completion(.failure(error))
            }
        })
    }
    
    //MD가 유저 전체에게 경고
    static func warning(clubId:Int, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.warning, clubId)
        
        AF.request(endpoint, method: .put).responseDecodable(of: BlankResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("전체 경고 발송 요청 성공")
                completion(.success(res))
            case .failure(_):
                print("전체 경고 발송 요청 실패")
                //completion(.failure(error))
            }
        })
    }
    
    //유저 클럽 입장/퇴장 상태 변경 요청
    static func warning(clubId: Int, userId: Int, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.userState, clubId, userId)
        
        AF.request(endpoint, method: .put).responseDecodable(of: BlankResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("유저 입장/퇴장 요청 성공")
                completion(.success(res))
            case .failure(_):
                print("유저 입장/퇴장 요청 실패")
                //completion(.failure(error))
            }
        })
    }

    //유저가 티켓 구매 요청
    static func buyTicket(clubId:Int, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.buyTicket, clubId)
        
        AF.request(endpoint, method: .post).responseDecodable(of: BlankResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("티켓 구매 요청 성공")
                
                //완료 핸들러에서 ticket 정보를 담고 있는 배열에 해당 클럽의 티켓을 추가해야함
                completion(.success(res))
            case .failure(_):
                print("티켓 구매 요청 실패")
                //completion(.failure(error))
            }
        })
    }
    
    //테이블 상태 메세지 설정 요청
    static func setMessage(clubId:Int, param: Parameters, tableId: Int, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.message, clubId, tableId)
        
        AF.request(endpoint, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: BlankResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("테이블 상태 메세지 요청 성공")
                completion(.success(res))
            case .failure(_):
                print("테이블 상태 메세지 요청 실패")
                //completion(.failure(error))
            }
        })
    }
    
    //유저 전체 티켓 조회 요청
    static func getTable(userId: Int, completion: @escaping (Result<TicketResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.readTicket, userId)

        AF.request(endpoint, method: .get).responseDecodable(of: TicketResponse.self) { response in
            switch response.result{
            case .success(let res):
                print("클럽 테이블 조회 성공")
                
                //완료 핸들러에서 티켓 정보 가져온거 처리
                completion(.success(res))
            case .failure(_):
                print("클럽 테이블 조회 실패")
                //completion(.failure(error))
            }
        }
    }
    
    //유저 권한 변경 요청
    static func changeAuth(userId: Int, completion: @escaping (Result<BlankResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.changeUserAuth, userId)
        
        AF.request(endpoint, method: .put).responseDecodable(of: BlankResponse.self, completionHandler: { response in
            switch response.result{
            case .success(let res):
                print("유저 권한 변경 요청 성공")
                completion(.success(res))
            case .failure(_):
                print("유저 권한 변경 요청 실패")
                //completion(.failure(error))
            }
        })
    }
    
    //MD가 유저에게 받은 신고 조회 요청
    static func readReport(clubId: Int, completion: @escaping (Result<ReadReportResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.mdObserver, clubId)

        AF.request(endpoint, method: .get).responseDecodable(of: ReadReportResponse.self) { response in
            switch response.result{
            case .success(let res):
                print("클랩 내 신고 조회 성공")
                //완료 핸들러에서 조회한 신고 내용들 처리
                completion(.success(res))
            case .failure(_):
                print("클럽 내 신고 조회 실패")
                //completion(.failure(error))
            }
        }
    }
    
    //클럽 내 안전상태 확인 요청
    static func confirmSafety(clubId: Int, completion: @escaping (Result<DataResponse, Error>) -> Void){
        let endpoint = String(format: APIConstant.clientObserver, clubId)

        AF.request(endpoint, method: .get).responseDecodable(of: DataResponse.self) { response in
            switch response.result{
            case .success(let res):
                print("클랩 안전 상태 조회 성공")
                completion(.success(res))
            case .failure(_):
                print("클럽 안전 상태 조회 실패")
                //completion(.failure(error))
            }
        }
    }
    
    
}

