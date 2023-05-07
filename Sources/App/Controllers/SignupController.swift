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
        
        signup.get(use: getRegisteredUsers)
        signup.post(use: createUser)
    }
    
    func getRegisteredUsers(req:Request) async throws -> ApiResponse<[Signup]>{
        let allUsers = try await Signup.query(on: req.db).all()
        return ApiResponse(status: .ok, message: "Users fetched Successfully", body: allUsers)
    }
    
    
    func createUser(req: Request) async throws -> ApiResponse<Signup>  {
        try Signup.validate(content: req)
        
        let user = try req.content.decode(Signup.self)
        
        //check if user is already available
        if try await !checkEmailAvailability(req, userData: user) {
            return ApiResponse(status: .alreadyReported, message: "Email address is already available in our DB")
        }else{
            try await user.save(on: req.db)
            return ApiResponse(status: .ok, message: "User Created Successfully", body: user)
        }
    }
}


extension SignupController{
    private func checkEmailAvailability(_ req: Request, userData:Signup) async throws -> Bool {
        let email = userData.email

        // Use a Fluent query to search for a user with the given email
        let user = try await Signup.query(on: req.db)
            .filter(\.$email == email)
            .first()

        // If a user was found, the email is not available
        // If no user was found, the email is available
        return user == nil
    }

}
