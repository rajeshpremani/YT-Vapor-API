//
//  CreateSongs.swift
//  
//
//  Created by Rajesh Kumar Sahil on 30/04/2023.
//

import Fluent

struct CreateSongs: AsyncMigration{
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("songs").delete()
    }
}
