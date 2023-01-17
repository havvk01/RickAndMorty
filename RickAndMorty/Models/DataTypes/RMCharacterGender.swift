//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 17.01.2023.
//

import Foundation

enum RMCharacterGender: String, Codable {
    // Female, Male, Genderless or unkown
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
