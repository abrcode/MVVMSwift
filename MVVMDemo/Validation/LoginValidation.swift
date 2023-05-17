//
//  LoginValidation.swift
//  MVVMDemo
//
//  Created by Pardy Panda Mac Mini on 15/05/23.
//

import Foundation


enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{6,15}$" // Password length 6-15
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$" // e.g. hello sandeep
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
    case phoneNo = "[0-9]{10,14}" // PhoneNo 10-14 Digits
}

struct LoginValidation {
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
            let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
            let result = stringTest.evaluate(with: testStr)
            return result
        }
    
    func validate(loginReq : LoginRequest) -> ValidationResult{
        
        // Email Validation
        if(loginReq.userEmail!.isEmpty) {
            return ValidationResult(success: false, error: "User email is empty")
        } else if isValidRegEx(loginReq.userEmail!, RegEx.email) {
            return ValidationResult(success: false, error: "Invalid Email")
        }
        
        // Password Validation
        if(loginReq.userPassword!.isEmpty) {
            return ValidationResult(success: false, error: "User password is empty")
        } else if isValidRegEx(loginReq.userPassword!, RegEx.password) {
            return ValidationResult(success: false, error: "Invalid Password")
        }
        
        // Phone Validation
//        if(loginReq.userPhone!.isEmpty) {
//            return ValidationResult(success: false, error: "User PhoneNo is empty")
//        } else if isValidRegEx(loginReq.userPhone!, RegEx.phoneNo) {
//            return ValidationResult(success: false, error: "Invalid Phone")
//        }
        
        return ValidationResult(success: true, error: nil)
        
    }
    
}
