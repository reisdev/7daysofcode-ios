//
//  MovieService.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 08/12/22.
//

import Foundation

protocol MovieServiceProtocol {
    func getPopularMovies(completion: @escaping (Result<PaginatedResponse<Movie>,ServiceError>) -> Void)
}

final class MovieService: MovieServiceProtocol {
    
    private let baseURL = "https://api.themoviedb.org/3/movie"
    
    private let session: URLSession
    private let credentialsService: CredentialServiceProtocol
    
    init(session: URLSession = .shared, credentialsService: CredentialServiceProtocol) {
        self.session = session
        self.credentialsService = credentialsService
    }
    
    func getPopularMovies(completion: @escaping (Result<PaginatedResponse<Movie>,ServiceError>) -> Void) {
        guard var url = URL(string: "\(baseURL)/popular") else {
            completion(.failure(.malformedUrl))
            return
        }
        
        url.append(queryItems: [.init(name: "api_key", value: credentialsService.get("TMDB_API_KEY"))])
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.badRequest))
                return
            }
            
            guard response is HTTPURLResponse else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.emptyData))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(PaginatedResponse<Movie>.self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(.decoding))
            }
        }.resume()
    }
    
    func getById(_ id: Int) {
        // TODO: Implementar requisição dos dados do filme pelo id
    }
}
