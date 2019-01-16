//
//  ContactsModel.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/11/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import Foundation

class ContactsModel {
    
    static var shared = ContactsModel()
    private init() {
         createNewContacts()
    }
    
    var arrayOfContacts: Contact!

    private func createNewContacts() {
        
        let path = Bundle.main.path(forResource: "generated-3", ofType: "json")
        let contact = try! JSONDecoder().decode(Contact.self, from: Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe))
        self.arrayOfContacts = contact
        
    }
}

typealias Contact = [ContactElement]

struct ContactElement: Codable {
    let id: String
    let index: Int
    let guid: String
    let isActive: Bool
    let balance: String
    let picture: String
    let age: Int
    let eyeColor, name, gender, position, company: String
    let email, phone, address, about: String
    let registered: String
    let latitude, longitude: Double
    let tags: [String]
    let friends: [Friend]
    let greeting, favoriteFruit: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case index, guid, isActive, balance, picture, age, eyeColor, name, gender, company, email, phone, address, about, registered, latitude, longitude, tags, friends, greeting, favoriteFruit, position
    }
}

struct Friend: Codable {
    let id: Int
    let name: String
}

enum ManImage: String, CaseIterable {
    case icon2
    case icon3
}
enum WomanImage: String, CaseIterable {
    case icon1
    case icon4
}
