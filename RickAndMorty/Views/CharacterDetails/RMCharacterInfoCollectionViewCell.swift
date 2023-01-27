//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 26.01.2023.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdetifer = "RMCharacterInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        
    }
}
