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