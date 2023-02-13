//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 13.02.2023.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var location: [RMLocationView] = []
    
    // Location response info
    // Will containt next url, if present
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
