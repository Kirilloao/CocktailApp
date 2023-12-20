//
//  NetworkManager.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

// MARK: - NetworkManagerProtocol
protocol NetworkManagerProtocol {
    func fetchCoctails(with name: String, completion: @escaping(Result<[Cocktail], NetworkError>) -> Void)
}

// MARK: - NetworkManager
final class NetworkManager: NetworkManagerProtocol {
    
    func fetchCoctails(with name: String, completion: @escaping(Result<[Cocktail], NetworkError>) -> Void) {
        let name = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/cocktail?name="+name!)!
        
        var request = URLRequest(url: url)
        request.setValue("mzhUSrz8Om2Xf0y26RN8jQ==pkxrr8mkTXSroqfn", forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let coctails = try JSONDecoder().decode([Cocktail].self, from: data)
                
                completion(.success(coctails))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
