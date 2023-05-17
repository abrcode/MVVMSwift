//
//  APIService.swift
//  MVVMDemo
//
//  Created by Pardy Panda Mac Mini on 12/05/23.
//

import Foundation


struct APIService {
    
    // Get API Call
    func getWebService<T: Decodable> (requestUrl : URL ,
                                      resulType : T.Type ,
                                      completion : @escaping(_ result : T?) -> Void) {
        
        
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpResponse, error) in
            if (error == nil && responseData != nil && responseData?.count != 0) {
               let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completion(result)
                    
                } catch let error {
                    debugPrint("error occured while decoding = \(error)")
                }
                
            }
        }.resume()
    }
    
    
    // Post API Call
    func postWebService<T: Decodable>( url : URL,
                                       requstBody : Data ,
                                       resultType : T.Type ,
                                       completion : @escaping(_ result : T) -> Void) {
     
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requstBody
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpResponse, error) in
            
            if (error == nil && responseData != nil && responseData?.count != 0) {
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completion(result)
                } catch let error {
                    debugPrint("error occured while decoding = \(error)")
                }
                
            }
            
        }.resume()
    }
}
