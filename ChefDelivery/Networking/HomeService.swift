//
//  HomeService.swift
//  ChefDelivery
//  Created by James on 23/12/24.
//

import Foundation

enum RequestError: Error{
    case invalidURL
    case invalidResponse
}



struct HomeService{
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        
        let url = URL(string: "https://private-779d119-aulasswift.apiary-mock.com/home")
        
        guard let url else {
            return .failure(RequestError.invalidURL)
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        
        let (Data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: Data)
        
        return .success(storesObjects)
        
        
//        URLSession.shared.dataTask(with: url!) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                
//            }
//            else if let data = data {
//                do{
//                    let storeObjects = try JSONDecoder().decode([StoreType].self, from: data)
//
//                    
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }.resume()
    }
    
}






