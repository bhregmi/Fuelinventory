import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    let todoController = TodoController()
    app.get("todos", use: todoController.index)
    app.post("todos", use: todoController.create)
    app.delete("todos", ":todoID", use: todoController.delete)
    
    //MARK: For Customer
    let customerController = CustomerController()
    app.get("customer", use: customerController.index)
//    app.get("customer", ":customerID", use: customerController.index)
    app.post("customer", use: customerController.create)
    app.delete("customer", ":customerID", use: customerController.delete)
    
    //MARK: For Customer PAN
    let customerPanController = CustomerPanController()
        app.get("customerpan", use: customerPanController.index)
    //    app.get("customer", ":customerID", use: customerController.index)
//        app.post("customer", use: customerController.create)
//        app.delete("customer", ":customerID", use: customerController.delete)
    
    //MARK: For Users
//    let userController = UserController()
//    app.get("me", use: userController.getMyOwnUser)
//    app.post("signup", use: userController.create)
//    app.post("login", use: userController.login)
    try app.register(collection: UserController())
    
    // New users
//    app.grouped(UserModelFragmentAuthenticator(),UserModel.guardMiddleware())
//    .get("sign-in") { req in
//        "I'm authenticated"
//    }
    
    let fuelNameRateController = FuelNameRateController()
    app.get("fuelnamerate", use: fuelNameRateController.index)
    app.post("fuelnamerate", use: fuelNameRateController.create)
    app.delete("fuelnamerate", ":fuelnamerateID", use: fuelNameRateController.delete)

    let fuelinventoryController = FuelInventoryController()
    app.get("fuelinventory", use: fuelinventoryController.index)
    app.post("fuelinventory", use: fuelinventoryController.create)
    app.delete("fuelinventory", ":fuelInventoryID", use: fuelinventoryController.delete)
}
