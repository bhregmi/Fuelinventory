//
//  File.swift
//  
//
//  Created by Test User on 4/27/20.
//

import Fluent
import Vapor

final class FuelNameRate: Model, Content {
    static let schema = "fuel_name_rate"
    
    @ID(custom: "id")
    var id: Int?
    

    @Field(key: "fuel_name")
    var fuelName: String
    
    @Field(key: "fuel_rate")
    var fuelRate: Double
    
   
    @Field(key: "rate_revised_date")
    var rateRevisedDate: Date?
    
    
    @Field(key: "created_by")
    var createdBy: String
    
    @Timestamp(key: "created_on", on: .create)
    var createdOn: Date?

    @Children(for: \.$fuelNameRate)
    var fuelInventory: [FuelInventory]

    init() { }

    init(id: Int? = nil, fuelName: String, fuelRate: Double, rateRevisedDate: Date, createdBy: String, createdOn: Date) {
        self.id = id
        self.fuelName = fuelName
        self.fuelRate = fuelRate
        self.rateRevisedDate = rateRevisedDate
        self.createdBy = createdBy
        self.createdOn = createdOn
    }
}

