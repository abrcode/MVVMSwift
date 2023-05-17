//
//  LoginResponse.swift
//  MVVMDemo
//
//  Created by Pardy Panda Mac Mini on 15/05/23.
//

import Foundation

struct LoginResponse : Decodable {
    
    let errorMessage : String?
    let data : LoginResponseData?
    
}


struct LoginResponseData : Decodable {
    
    let userName : String?
    let userID : String?
    let email : String?
    
    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
    
}
