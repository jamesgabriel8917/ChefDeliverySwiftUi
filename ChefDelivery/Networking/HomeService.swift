//
//  HomeService.swift
//  ChefDelivery
//  Created by James on 23/12/24.
//

import Foundation

enum RequestError: Error{
    case invalidURL
    case invalidResponse
    case decodingError
}

struct HomeService{
    

    func fetchData() async -> Result<[StoreType], RequestError> {
        let urlString = "https://private-779d119-aulasswift.apiary-mock.com/home"
        
        guard let url = URL(string: urlString) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
            return .success(storesObjects)
        } catch {
            return .failure(.decodingError)
        }
    }
    
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        
            guard let url = URL(string: "https://private-779d119-aulasswift.apiary-mock.com/home") else {
                return .failure(.invalidURL)
        }
        
        let ecodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = ecodedObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
}



