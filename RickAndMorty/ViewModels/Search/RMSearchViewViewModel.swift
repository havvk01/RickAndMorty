//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 16.02.2023.
//

import Foundation

// Responsibilities
// - show search results
// - show no results view
// - kick off api request

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    
    private var searchtext = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    
    
    // MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    // MARK: - Public
    
    public func executeSearch() {
        var queryParams: [URLQueryItem] = []
        switch config.type {
        case .character:
            searchtext = "Rick"
            queryParams.append(URLQueryItem(name: "name", value: searchtext))
        case .episode:
            queryParams.append(URLQueryItem(name: "name", value: searchtext))
        case .location:
            queryParams.append(URLQueryItem(name: "name", value: searchtext))
        }
        
        // Add options
        queryParams.append(URLQueryItem(name: "name", value: searchtext))
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchInputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        let request = RMRequest(
            endpoint: config.type.endpoint,
            queryParameters: queryParams
        )
        
        RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Search results found \(model.results.count)")
            case .failure:
                break
            }
        }
        
        // Notify view of results, no results? or error
    }
    
    public func set(query text: String) {
        self.searchtext = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(_ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
    
}
