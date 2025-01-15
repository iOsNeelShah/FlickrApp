//
//  ImageSearchViewModel.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import Foundation

class ImageSearchViewModel: ObservableObject {
    @Published var images: [FlickrImage] = []
    @Published var isLoading = false
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func searchImages(for query: String) {
        guard !query.isEmpty else { return }
        isLoading = true
        
        apiService.fetchImages(for: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let images):
                    self?.images = images
                case .failure(let error):
                    print("Error fetching images: \(error.localizedDescription)")
                    self?.images = []
                }
            }
        }
    }
}
