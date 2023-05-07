//
//  LoginController.swift
//  
//
//  Created by Rajesh Kumar Sahil on 07/05/2023.
//
import Vapor
import Fluent

class LoginController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        let loginGroup = routes.grouped("login")
        
        loginGroup.post(use: login)
    }
    
    func login(req: Request) async throws -> ApiResponse<String>{
        let user = try req.content.decode(Login.self)
        
        
        if try await checkEmailAvailability(req, userData: user){
            req.logger.log(level: .error, "Login request failed")
            return ApiResponse(status: .unauthorized, message: "Login Failed")
        }else{
            req.logger.log(level: .info, "Success")
            return ApiResponse(status: .ok, message: "Login Successfull")
        }
    }
}



extension LoginController{
    private func checkEmailAvailability(_ req: Request, userData:Login) async throws -> Bool {
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
