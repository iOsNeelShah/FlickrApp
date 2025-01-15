//
//  ApiService.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import Foundation

protocol APIService {
    func fetchImages(for query: String, completion: @escaping (Result<[FlickrImage], Error>) -> Void)
}

class FlickrAPIService: APIService {
    func fetchImages(for query: String, completion: @escaping (Result<[FlickrImage], Error>) -> Void) {
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(query)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(FlickrAPIResponse.self, from: data)
                completion(.success(result.items))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
