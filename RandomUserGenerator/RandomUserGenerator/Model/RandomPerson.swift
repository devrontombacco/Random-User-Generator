//
//  RandomPerson.swift
//  RandomUserGenerator
//
//  Created by Devron Tombacco on 05/08/2020.
//  Copyright © 2020 dtomswift. All rights reserved.
//

import Foundation

struct RandomPerson: Codable {
    let results: [PersonInfo]
}

struct PersonInfo: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: LoginInfo
    let dob: DateOfBirth
    let phone: String
    let picture: PictureString
    let nat: String
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Location: Codable {
        let street: StreetInfo
        let city: String
        let state: String
        let country: String
        
        struct StreetInfo: Codable {
            let number: Int
            let name: String
        }
    }
    
    struct LoginInfo: Codable {
        let username: String
    }
    
    struct DateOfBirth: Codable {
        let date: String
    }
    
    struct PictureString: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
}
