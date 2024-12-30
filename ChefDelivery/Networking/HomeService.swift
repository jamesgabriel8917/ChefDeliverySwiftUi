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
}



