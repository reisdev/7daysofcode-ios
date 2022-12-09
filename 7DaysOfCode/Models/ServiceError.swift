//
//  ServiceError.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 08/12/22.
//

import Foundation

enum ServiceError: Error {
    case malformedUrl
    case badRequest
    case badResponse
    case invalidCredentials
    case notFound
    case emptyData
    case decoding
}
