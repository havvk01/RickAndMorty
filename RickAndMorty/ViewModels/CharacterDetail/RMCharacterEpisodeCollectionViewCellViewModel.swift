//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 26.01.2023.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}
