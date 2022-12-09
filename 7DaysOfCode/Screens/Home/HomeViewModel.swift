//
//  HomeViewModel.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 09/12/22.
//

import Foundation

final class HomeViewModel {
    
    private let movieService: MovieServiceProtocol
    
    var movies: [Movie] = []
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
    func fetchPopularMovies(completion: @escaping () -> Void) {
        movieService.getPopularMovies { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
