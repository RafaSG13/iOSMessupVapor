//
//  Expense.swift
//  iOSMessupVapor
//
//  Created by Rafael Serrano Gamarra on 8/2/25.
//

import Foundation
import Vapor

struct Expense: Content {
    var id: String = UUID().uuidString
    var name: String
    var amount: Double
    var date: Date
    var paymentMethod: PaymentMethod
    var category: Category
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
