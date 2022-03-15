//
//  NetworkClient.swift
//  TestTask
//
//  Created by Vardan Sargsyan on 14.03.22.
//

import Foundation
import Alamofire

class NetworkClient {
    static let shared: NetworkClient = NetworkClient()
    
    let baseURL = "https://api.jsonbin.io/b/620ca6bc1b38ee4b33bd9656"
    
    
    
    func getSections(complition: @escaping (_ response: [Section]?) -> Void){
        
        let url = baseURL
        
        AF.request(url, method: .get , parameters: nil , encoding: JSONEncoding.default).responseDecodable(of: BaseResponseModel.self) { response in
            if response.value?.sections.count != 0 {
                complition(response.value?.sections)
            }
            
        }
    }
    
    
    
}
