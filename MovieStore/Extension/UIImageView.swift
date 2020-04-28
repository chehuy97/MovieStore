//
//  UIImageView.swift
//  MovieStore
//
//  Created by Arthur on 4/27/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import SwiftUI

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
