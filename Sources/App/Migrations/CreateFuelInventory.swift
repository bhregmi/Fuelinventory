//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent

struct CreateFuelInventory: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fuel_inventory")
//            .id()
            .field("id", .int, .identifier(auto: true))
            .field("fuel_quantity", .double, .required)
            .field("unloaded_date", .datetime, .required)
            .field("unloaded_by", .string, .required)
            .field("is_billable", .bool, .required)
            .field("created_on", .datetime, .required)
            .field("customer_id", .int, .references("customers", "id"))
            .field("fuel_name_rate_id", .int, .references("fuel_name_rate", "id"))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fuel_inventory").delete()
    }
}

//static func prepare(on conn: PostgreSQLConnection) -> Future<Void> {
//    return Database.update(User.self, on: conn) { builder in
//        builder.field(for: \User.firstName, type: .text, .default(.literal("")))
//    }
//}

