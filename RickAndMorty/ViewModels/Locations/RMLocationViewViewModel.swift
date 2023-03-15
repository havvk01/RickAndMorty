//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 13.02.2023.
//

import Foundation

protocol RMLocationViewViewModelDelegate :AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {
    
    weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    // Location response info
    // Will containt next url, if present
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocations = false
    
    // MARK: - Init
    
    init() {
        
    }
    
    /// Paginate if additional episodes are needed
    public func fetchAditionalLocations() {
        guard !isLoadingMoreLocations else {
            return
        }
        
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        
        
        isLoadingMoreLocations = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
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
                print("More Locations: \(moreResults.count)")
//                strongSelf.apiInfo = info
//
//                let originalCount = strongSelf.episodes.count
//                let newCount = moreResults.count
//                let total = originalCount+newCount
//                let startingIndex = total - newCount
//                let indexPathsToAdds: [IndexPath] = Array(startingIndex..<(startingIndex+newCount)).compactMap({
//                    return IndexPath(row: $0, section: 0)
//                })
//
//                strongSelf.episodes.append(contentsOf: moreResults)
//
//                DispatchQueue.main.async {
//                    strongSelf.delegate?.didLoadMoreEpisodes(with: indexPathsToAdds)
//                    strongSelf.isLoadingMoreCharacters = false
//                }
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreLocations = false
            }
        }
        
    }
    
    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            .listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
                switch result {
                case .success(let model):
                    self?.apiInfo = model.info
                    self?.locations = model.results
                    DispatchQueue.main.async {
                        self?.delegate?.didFetchInitialLocations()
                    }
                case .failure(_):
                    // TODO: Handle Error
                    break 
                }
            }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
