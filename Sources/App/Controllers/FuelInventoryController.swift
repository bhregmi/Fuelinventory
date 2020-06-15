//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent
import Vapor


struct FuelInventoryController {
    func index(req: Request) throws -> EventLoopFuture<[FuelInventory]> {
        return FuelInventory.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<FuelInventory> {
        let fuelInventory = try req.content.decode(FuelInventory.self)
        return fuelInventory.save(on: req.db).map { fuelInventory}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return FuelInventory.find(req.parameters.get("fuelInventoryID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

