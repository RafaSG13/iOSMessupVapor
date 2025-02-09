import Vapor

func routes(_ app: Application) throws {

    let expenses: [Expense] = [
        Expense(name: "Nike Store", amount: 59.95, date: Date(), paymentMethod: .creditCard, category: .fashion),
        Expense(name: "Apple Store", amount: 329.99, date: Date().addingTimeInterval(-86400), paymentMethod: .creditCard, category: .technology),
        Expense(name: "Zara Store", amount: 75.49, date: Date().addingTimeInterval(-172800), paymentMethod: .debitCard, category: .fashion),
        Expense(name: "Gym Membership", amount: 45.00, date: Date().addingTimeInterval(-2592000), paymentMethod: .debitCard, category: .health),
    ]

    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("expenses", ":userId") { req in
        guard let _ = req.parameters.get("userId") else {
            throw Abort(.badRequest)
        }
        return expenses
    }

    app.put("expenses", ":expenseId") { req in
        guard let expenseId = req.parameters.get("expenseId") else {
            throw Abort(.badRequest, reason: "Expense ID parameter is required")
        }
        return "Updated expense with ID: \(expenseId)"
    }
}
