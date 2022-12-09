//
//  HomeViewController.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 17/11/22.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
       return HomeView()
    }()
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = homeView
        homeView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeView.setupGradientBackground()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        viewModel.fetchPopularMovies { [weak self] in
            guard let self = self else { return }
            self.homeView.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeView.cellIdentifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = viewModel.movies[indexPath.row]
        cell.setup(with: movie)
        return cell
    }
}
