//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 05.03.2023.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
