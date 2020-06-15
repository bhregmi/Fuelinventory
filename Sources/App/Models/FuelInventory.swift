//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent
import Vapor

final class FuelInventory: Model, Content {
    static let schema = "fuel_inventory"
    
    @ID(custom: "id")
    var id: Int?
        
    @Field(key: "fuel_quantity")
    var fuelQuantity: Double
    
    @Field(key: "unloaded_date")
    var unloadedDate: Date?
    
    @Field(key: "unloaded_by")
    var unloadedBy: String
    
    @Field(key: "is_billable")
    var isBillable: Bool
    
    @Timestamp(key: "created_on", on: .create)
    var createdOn: Date?
    
    // Reference to the Customer this record belongs to .
     @Parent(key: "customer_id")
     var customer: Customer
    
    // Reference to the Gas Rate this record belongs to .
    @Parent(key: "fuel_name_rate_id")
    var fuelNameRate: FuelNameRate


    init() { }

    init(id: Int? = nil, fuelQuantity: Double, unloadedDate: Date, unloadedBy: String, isBillable: Bool, createdOn: Date, customerID: Int,fuelNameRateID: Int) {
        self.id = id
        self.fuelQuantity = fuelQuantity
        self.unloadedDate = unloadedDate
        self.unloadedBy = unloadedBy
        self.isBillable = isBillable
        self.createdOn = createdOn
        self.$customer.id = customerID
        self.$fuelNameRate.id = fuelNameRateID
    }
}
