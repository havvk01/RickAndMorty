//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Slava Havvk on 18.01.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
