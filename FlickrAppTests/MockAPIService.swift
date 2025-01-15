//
//  MockAPIService.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

@testable import FlickrApp

class MockAPIService: APIService {
    func fetchImages(for query: String, completion: @escaping (Result<[FlickrImage], Error>) -> Void) {
        let mockImages = [
            FlickrImage(title: "Hello", link: "link", media: ["m": "url"], description: "desc", author: "author", published: "date", author_id: "id", tags: "tag"),
            FlickrImage(title: "Hello1", link: "link1", media: ["m": "url1"], description: "desc1", author: "author1", published: "date1", author_id: "id1", tags: "tag1")
        ]
        completion(.success(mockImages))
    }
}
