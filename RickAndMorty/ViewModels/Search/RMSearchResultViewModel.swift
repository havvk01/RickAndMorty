//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 05.03.2023.
//

import Foundation

protocol RMSearchResultRepresentable {
    associatedtype ResultType
    
    var results: [ResultType] { get }
}

struct RMSearchResultViewModel<T>: RMSearchResultRepresentable {
    typealias ResultType = T 
    var results: [ResultType]
}
