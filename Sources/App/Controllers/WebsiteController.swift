//
//  WebsiteController.swift
//  
//
//  Created by Rajesh Kumar Sahil on 07/05/2023.
//

import Vapor
import Leaf

struct WebsiteController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("home", use: index)
    }
    
    
    func index(req: Request) async throws -> View{
        let context = IndexContent(title: "Home")
        return try await req.view.render("index", context)
    }
    
}


struct IndexContent: Encodable{
    var title:String
}
