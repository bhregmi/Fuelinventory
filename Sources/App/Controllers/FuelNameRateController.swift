//
//  File.swift
//  
//
//  Created by Test User on 4/27/20.
//

import Fluent
import Vapor


struct FuelNameRateController {
    func index(req: Request) throws -> EventLoopFuture<[FuelNameRate]> {
        return FuelNameRate.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<FuelNameRate> {
        let fuelNameRate = try req.content.decode(FuelNameRate.self)
        return fuelNameRate.save(on: req.db).map { fuelNameRate}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return FuelNameRate.find(req.parameters.get("fuelnamerateID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
