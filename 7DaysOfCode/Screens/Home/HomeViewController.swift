//
//  HomeViewController.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 17/11/22.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    private let movies: [Movie] = [
        .init(title: "Órfã 2: A Origem", releaseDate: "27/09/2022", cover: "a-orfa"),
        .init(title: "Minions 2: A Origem de Gru", releaseDate: "30/06/2022", cover: "minions-2"),
        .init(title: "Thor: Amor e Trovão", releaseDate: "06/06/2022", cover: "thor-love-and-thunder"),
        .init(title: "Avatar", releaseDate: "18/12/09", cover: "avatar"),
    ]
    
    private lazy var homeView: HomeView = {
       return HomeView()
    }()
    
    override func loadView() {
        self.view = homeView
        homeView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeView.setupGradientBackground()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        homeView.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeView.cellIdentifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.setup(with: movie)
        return cell
    }
}
