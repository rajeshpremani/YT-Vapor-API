//
//  ApiResponse.swift
//  
//
//  Created by Rajesh Kumar Sahil on 07/05/2023.
//

import Vapor

final class ApiResponse<T: Content>: Content {
    var status: HTTPResponseStatus
    var message: String
    var body: T?
    
    init(status: HTTPResponseStatus, message: String, body: T? = nil) {
        self.status = status
        self.message = message
        self.body = body
    }
}
