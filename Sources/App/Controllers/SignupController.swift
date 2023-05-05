//
//  SignupController.swift
//  
//
//  Created by Rajesh Kumar Sahil on 05/05/2023.
//

import Vapor
import Fluent

struct SignupController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let signup = routes.grouped("signup")
        
        signup.post(use: createUser)
    }
    
    
    func createUser(req: Request) async throws -> String  {
        let user = try req.content.decode(Signup.self)
        try await user.save(on: req.db)
        return "User Created Successfully"
        
    }
}
