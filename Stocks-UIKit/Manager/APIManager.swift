//
//  APIManager.swift
//  Stocks-UIKit
//
//  Created by Rupesh on 17/12/21.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    private struct Constants {
        static let apiKey = ""
        static let sandBoxApiKey = ""
        static let baseUrl = ""
    }
    
    
    //MARK: PUBLIC
    
    
    
    
    
    //MARK: PRIVATE
    
    private enum Endpoint : String {
        case search
    }
    
    private enum APIError : Error {
        case invalidUrl
        case noDataReturned
    }
    
    private func url(
        for endpoint : Endpoint,
        params : [String: String] = [:])  ->  URL? {
        
        return nil
    }
    
    private func request<T: Codable>(
        url : URL?,
        expecting : T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = url else {
            completion(.failure(APIError.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
}
