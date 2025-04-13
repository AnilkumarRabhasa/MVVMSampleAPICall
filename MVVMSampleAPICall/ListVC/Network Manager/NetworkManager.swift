//
//  NetworkManager.swift
//  MVVMSampleAPICall
//
//  Created by Anilkumar on 12/04/25.
//

import Foundation

class NetworkManager {
    
    class func fetchListOfItems(completion: @escaping ([Posts]?, String?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(nil, "Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(nil, "No data received")
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Posts].self, from: data)
                completion(posts, nil)
            } catch {
                completion(nil,error.localizedDescription)
            }
        }.resume()
    }
}
