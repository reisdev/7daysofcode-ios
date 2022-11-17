//
//  HomeView.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 17/11/22.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    // MARK: - Subviews
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Filmes Populares"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    // MARK: - Properties
    
    let cellIdentifier = "MovieTableViewCell"
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        constraintUI()
        setupGradientBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    private func constraintUI() {
        addSubview(titleLabel)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - API
    
    /// Setups the gradient background for the view, from #2E1371 to #130B2B, top to bottom
    public func setupGradientBackground() {
        let topColor = UIColor(red: 46/255, green: 19/255, blue: 113/255, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 19/255, green: 11/255, blue: 43/255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
