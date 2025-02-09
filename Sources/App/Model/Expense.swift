//
//  Expense.swift
//  iOSMessupVapor
//
//  Created by Rafael Serrano Gamarra on 8/2/25.
//

import Foundation
import Vapor
import Fluent

///https://blog.vapor.codes/posts/fluent-models-and-sendable/

final class Expense: Model, Content, @unchecked Sendable {

    static let schema: String = Schemas.expenses.rawValue

    @ID(key: .id)
    var id: UUID?

    @Field(key: FieldKeys.name)
    var name: String

    @Field(key: FieldKeys.amount)
    var amount: Double

    @Field(key: FieldKeys.date)
    var date: Date

    @Field(key: FieldKeys.paymentMethod)
    var paymentMethod: PaymentMethod

    @Field(key: FieldKeys.category)
    var category: Category

    init(id: UUID? = UUID(), name: String, amount: Double, date: Date, paymentMethod: PaymentMethod, category: Category) {
        self.id = id
        self.name = name
        self.amount = amount
        self.date = date
        self.paymentMethod = paymentMethod
        self.category = category
    }

    init() { }
}

// MARK: - Expense Categories

enum Category: String, Content {
    case entertainment = "Entertainment"
    case travel = "Travel"
    case food = "Food"
    case transportation = "Transportation"
    case health = "Health and Wellness"
    case home = "Home"
    case technology = "Technology and Communications"
    case fashion = "Fashion and Beauty"
    case education = "Education and Learning"
    case family = "Family and Pets"
    case finance = "Finance and Insurance"
    case taxes = "Taxes and Obligations"
    case charity = "Donations and Charity"
    case miscellaneous = "Miscellaneous"
}

// MARK: - PaymentMethods

enum PaymentMethod: String, Content {
    case cash = "Cash"
    case creditCard = "Credit Card"
    case debitCard = "Debit Card"
    case paypal = "Paypal"
    case other = "Other"
}

//MARK: - FieldKeys

extension Expense {
    struct FieldKeys {
        static var name: FieldKey { "name" }
        static var amount: FieldKey { "amount" }
        static var date: FieldKey { "date" }
        static var paymentMethod: FieldKey { "paymentMethod" }
        static var category: FieldKey { "category" }
    }
}
