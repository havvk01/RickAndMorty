//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 05.03.2023.
//

import Foundation

struct RMSearchResultViewModel {
    let results: RMSearchResultType
    let next: String?

    public private(set) var isLoadingMoreResults = false
    
    
    public var shouldShowloadMoreIndicator: Bool {
        return next != nil
    }
    
}

enum RMSearchResultType {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
