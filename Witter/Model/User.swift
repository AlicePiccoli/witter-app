//
//  User.swift
//  Witter
//
//  Created by m1 on 26/09/2023.
//


import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
