//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 16.01.2023.
//

import UIKit

/// Controller to show and search for Location
final class RMLocationViewController: UIViewController {

    private let primaryView = RMLocationView()
    
    private let viewModel = RMLocationViewViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        title = "Location"
        addSearchButton()
        addConstrains()
    }
    
    private func addSearchButton () {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func didTapSearch() {
        
    }

}
