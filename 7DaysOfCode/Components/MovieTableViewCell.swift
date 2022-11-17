//
//  MovieTableViewCell.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 17/11/22.
//

import Foundation
import UIKit

final class MovieTableViewCell: UITableViewCell {
    
    
    // MARK: - Subviews
    
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 18.0
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, releaseDateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8.0
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .init(white: 1.0, alpha: 0.87)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .init(white: 1.0, alpha: 0.40)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintUI()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    private func constraintUI() {
        addSubview(coverImageView)
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.0),
            coverImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            coverImageView.widthAnchor.constraint(equalToConstant: 90.0),
            coverImageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 16.0),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30.0),
        ])
    }
    
    // MARK: - API
    
    private func setupStyle() {
        backgroundColor = .clear
    }
    
    func setup(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
        coverImageView.image = .init(named: movie.cover)
    }
}
