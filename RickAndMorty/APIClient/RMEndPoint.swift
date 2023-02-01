//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 16.01.2023.
//

import Foundation

/// Respresents unique API Endpoint
@frozen enum RMEndPoint: String, CaseIterable, Hashable {
    /// Endpoint to get character info
    case character // "character"
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
