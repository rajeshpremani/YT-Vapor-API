//
//  BaseResponse.swift
//  
//
//  Created by Rajesh Kumar Sahil on 07/05/2023.
//

import Vapor


struct BaseResponse2: Content {
    let statusCode: HTTPResponseStatus
    let message: String
}


struct BaseResponse<T: Content>: Content {
    let status: HTTPResponseStatus
    let message: String
    let body: T?
    
    init(status: HTTPResponseStatus, message: String, body: T? = nil) {
        self.status = status
        self.message = message
        self.body = body
    }
}


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
