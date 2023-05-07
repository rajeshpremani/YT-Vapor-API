//
//  Signup.swift
//  
//
//  Created by Rajesh Kumar Sahil on 05/05/2023.
//

import Fluent
import Vapor

final class Signup: Model, Content{
    //Table name in DB
    static let schema: String = "signup"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")//Column name in DB
    var name:String
    
    @Field(key: "email")
    var email:String
    
    @Field(key: "mobileNumber")
    var mobileNumber:String?
    
    @Field(key: "password")
    var password:String
    
    
    
    init(){}
    
    init(id:UUID? = nil, name:String, email:String, mobileNumber:String?, password:String){
        self.id = id
        self.name = name
        self.email = email
        self.mobileNumber = mobileNumber
        self.password = password
    }
}


extension Signup: Validatable{
    static func validations(_ validations: inout Vapor.Validations) {
        validations.add("name", as:String.self, is: !.empty)
        validations.add("email", as: String.self, is: .email)
        validations.add("password",
                        as: String.self,
                        is: !.empty,
                        customFailureDescription: "Password cannot be empty.")
        validations.add("mobileNumber",
                        as: String.self,
                        is: .characterSet(CharacterSet(charactersIn: "1234567890")),
                        required: false, customFailureDescription: "Mobile number should contain numbers only.")
    }
    
    
}
