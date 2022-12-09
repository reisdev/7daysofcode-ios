//
//  UIImageView+Kingfisher.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 09/12/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func fetchImage(for path: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
        self.kf.setImage(with: url)
    }
}
