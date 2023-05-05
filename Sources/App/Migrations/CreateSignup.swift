//
//  CreateSignup.swift
//  
//
//  Created by Rajesh Kumar Sahil on 05/05/2023.
//

import Fluent

struct CreateSignup: Migration{
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("signup")
            .id()
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("password", .string, .required)
            .field("mobileNumber", .string)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("signup").delete()
    }
    
    
}
