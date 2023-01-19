//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 17.01.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    // Alive, Dead or unkown
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
