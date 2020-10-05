//
//  AllIndiaHistoricalDataWebServices.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/15/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

struct IndiaHistoricalDataWebServices {
    static func fetchIndiaHostoricalData(completion: @escaping (Result<IndiaHistory, NetworkError>) -> Void) {
        if let url = URL(string: API.indiaHistoricalData) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                    }
                    return
                }
                do {
                    let indiaHistoricalData = try JSONDecoder().decode(IndiaHistory.self.self, from: data)
                    completion(.success(indiaHistoricalData))
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
    }
    /*
   static func callAllIndiaHitoricalDataWebService(completion:@escaping (Bool, IndiaHistory?) -> Void) {
        let request = Request(withURL: API.allIndiaHistoricalData)
        request.successHandler = {( _ responseData: Data?, _ httpResponse: HTTPURLResponse?) -> Void in
            if let responseData = responseData {
                 let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(IndiaHistory.self, from: responseData) //{
                       DispatchQueue.main.async {
                           completion(true, response)
                       }
                } catch {
                    print(error)
                    completion(false, nil)
                }
            }
        }
        request.failureHandler = { (_ responseData: Data?, _ httpResponse: HTTPURLResponse?) -> Void in
            completion(false, nil)
        }
        let connection =  ConnectionManager.sharedInstance
        connection.start(request: request)
    }*/
}
