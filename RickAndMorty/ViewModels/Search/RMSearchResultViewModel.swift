//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 05.03.2023.
//

import Foundation

final class RMSearchResultViewModel {
    public private(set) var results: RMSearchResultType
    private var next: String?
    
    init(results: RMSearchResultType, next: String?) {
        self.results = results
        self.next = next
    }

    public private(set) var isLoadingMoreResults = false
    
    
    public var shouldShowloadMoreIndicator: Bool {
        return next != nil
    }
    
    public func fetchAditionalLocations(completion: @escaping () -> Void) {
        guard !isLoadingMoreResults else {
            return
        }
        
        guard let nextUrlString = next,
              let url = URL(string: nextUrlString) else {
            return
        }
        
        
        isLoadingMoreResults = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreResults = false
            return
        }
        RMService.shared.execute(request, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info  = responseModel.info
                strongSelf.next = info.next // Capture new pagination url

                let additionalLoactions = moreResults.compactMap({
                    return RMLocationTableViewCellViewModel(location: $0)
                })
                switch strongSelf.results {
                case .locations(let existingResults):
                    let newResults = existingResults + additionalLoactions
                    strongSelf.results = .locations(newResults)
                    break
                case .characters, .episodes:
                    break
                }
                
                DispatchQueue.main.async {
                    strongSelf.isLoadingMoreResults = false
                    
                     //Notify via callback
                    completion()
                }
                
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreResults = false
            }
        }
        
    }

}

enum RMSearchResultType {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
