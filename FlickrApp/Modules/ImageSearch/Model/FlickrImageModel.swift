//
//  FlickrImageModel.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import Foundation

struct FlickrAPIResponse: Codable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [FlickrImage]
}

struct FlickrImage: Codable {
    let title: String
    let link: String
    let media: [String: String]
    let description: String
    let author: String
    let date_taken: String
}
