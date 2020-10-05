//
//  CountriesWebService.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/15/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

struct CountriesWebService {
    static func fetchCountries(completion: @escaping (Result<[Country], NetworkError>) -> Void) {
        if let url = URL(string: API.countries) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                    }
                    return
                }
                do {
                    let countries = try JSONDecoder().decode(Array<Country>.self, from: data)
                    completion(.success(countries))
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
    }
}
