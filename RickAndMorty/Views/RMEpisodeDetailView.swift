//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 01.02.2023.
//

import UIKit

final class RMEpisodeDetailView: UIView {

    private var viewModel: RMEpisodeDetailViewViewModel?
    
    private var collectionView: UICollectionView?
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        self.collectionView = createCollectionView()
        addContrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addContrains() {
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func createCollectionView() -> UICollectionView {
        
    }
    
    // MARK: - Public
    
    public func configure(with viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
    
}
