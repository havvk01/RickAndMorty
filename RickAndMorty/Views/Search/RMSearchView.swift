//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 16.02.2023.
//

import UIKit

final class RMSearchView: UIView {

    private let viewModel: RMSearchViewViewModel
    
    // MARK: - Subviews
    
    private let searchInputView = RMSearchInputView()
    
    private let noResultsView = RMNoSearchResultView()
    
    // No results view
    
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
        print("hello")
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
            searchInputView.heightAnchor.constraint(equalToConstant: 110),
            
            // No Results
            noResultsView.widthAnchor.constraint(equalToConstant: 150),
            noResultsView.heightAnchor.constraint(equalToConstant: 150),
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
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
