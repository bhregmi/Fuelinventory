//
//  File.swift
//  
//
//  Created by Test User on 4/27/20.
//

import Fluent

struct CreateFuelRate: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fuel_name_rate")
//            .id()
            .field("id", .int, .identifier(auto: true))
            .field("fuel_name", .string, .required)
            .field("fuel_rate", .double, .required)
            .field("rate_revised_date", .datetime, .required)
            .field("created_by", .string, .required)
            .field("created_on", .datetime, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fuel_name_rate").delete()
    }
}
