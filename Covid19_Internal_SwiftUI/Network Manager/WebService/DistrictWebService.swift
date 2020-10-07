//
//  DistrictWebService.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/15/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

struct DistrictWebService {
    static func fetchDistricts(completion: @escaping (Result<[String: District], NetworkError>) -> Void) {
        if let url = URL(string: API.district) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                    }
                    return
                }
                do {
                    let districts = try JSONDecoder().decode([String: District].self, from: data)
                    completion(.success(districts))
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
    }
}
