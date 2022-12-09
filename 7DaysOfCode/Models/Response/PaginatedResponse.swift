//
//  PaginatedResponse.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 09/12/22.
//

import Foundation

struct PaginatedResponse<T: Decodable>: Decodable {
    let page: Int
    let results: [T]
    let total_pages: Int
    let total_results: Int
}
