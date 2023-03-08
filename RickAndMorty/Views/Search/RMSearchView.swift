//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 16.02.2023.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmSearchView(_ searchView: RMSearchView, diSelectOption option: RMSearchInputViewViewModel.DynamicOption)
}

final class RMSearchView: UIView {
    
    weak var delegate: RMSearchViewDelegate?

    private let viewModel: RMSearchViewViewModel
    
    // MARK: - Subviews
    
    private let searchInputView = RMSearchInputView()
    
    private let noResultsView = RMNoSearchResultView()
    
    // Results collection view
    
    // MARK: - Init
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(noResultsView, searchInputView)
        addConstraints()
        
        searchInputView.configure(with: RMSearchInputViewViewModel(type: viewModel.config.type))
        searchInputView.delegate = self
        
        viewModel.registerOptionChangeBlock { tuple in
            self.searchInputView.update(option: tuple.0, value: tuple.1)
        }
        viewModel.registerSearchResultHandler { results in
            print(results)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // Search input view
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.rightAnchor.constraint(equalTo: rightAnchor),
            searchInputView.leftAnchor.constraint(equalTo: leftAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: viewModel.config.type == .episode ? 55 : 110),
            
            // No Results
            noResultsView.widthAnchor.constraint(equalToConstant: 150),
            noResultsView.heightAnchor.constraint(equalToConstant: 150),
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    public func presentKeyboard() {
        searchInputView.presentKeyboard()
    }
    
}

// MARK: CollectionView

extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}

// MARK: _ RMSearchInputViewDelegate

extension RMSearchView: RMSearchInputViewDelegate {
        
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption) {
        delegate?.rmSearchView(self, diSelectOption: option)
    }
    
    func rmSearchInputView(_ inputView: RMSearchInputView, didChangeSearchText text: String) {
        viewModel.set(query: text)
    }
    
    func rmSearchInputViewDidtapSearchKeyboardButton(_ inputView: RMSearchInputView) {
        viewModel.executeSearch()
    }
}
