//
//  User.swift
//  iOSMessupVapor
//
//  Created by Rafael Serrano Gamarra on 9/2/25.
//

import Fluent
import Vapor
import Foundation

///https://blog.vapor.codes/posts/fluent-models-and-sendable/

final class User: Model, Content, @unchecked Sendable {

    static let schema: String = Schemas.users.rawValue

    @ID(key: .id)
    var id: UUID?

    @Field(key: FieldKeys.name)
    var name: String

    @Field(key: FieldKeys.email)
    var email: String

    @Field(key: FieldKeys.password)
    var password: String

    @OptionalField(key: FieldKeys.userImage)
    var userImage: String?

    init(id: UUID? = nil, name: String, email: String, password: String, userImage: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.userImage = userImage
    }

    init() { }

}

// MARK: - User Fieldkeys

extension User {
    struct FieldKeys {
        static var name: FieldKey { "name" }
        static var email: FieldKey { "email" }
        static var password: FieldKey { "password" }
        static var userImage: FieldKey { "userImage" }
    }
}
