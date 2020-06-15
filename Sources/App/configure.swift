import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateTodo())
    
    app.migrations.add(CreateCustomer())
    app.migrations.add(CreateFuelRate())
    app.migrations.add(CreateFuelInventory())
    app.migrations.add(CreatePan())
    app.migrations.add(CreateTokens())
    app.migrations.add(CreateUsers())

    
    //decoding and encoding of date for ISO8601 standard (required for sqlite)
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601

    ContentConfiguration.global.use(encoder: encoder, for: .json)

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    ContentConfiguration.global.use(decoder: decoder, for: .json)

    // register routes
    try routes(app)
}
