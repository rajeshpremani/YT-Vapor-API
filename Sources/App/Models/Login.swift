//
//  Login.swift
//  
//
//  Created by Rajesh Kumar Sahil on 07/05/2023.
//

import Vapor


final class Login:Content{
    
    var email:String
    var password:String
    
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
