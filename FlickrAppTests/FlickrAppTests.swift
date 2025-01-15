//
//  FlickrAppTests.swift
//  FlickrAppTests
//
//  Created by Neel on 1/15/25.
//

import Combine
import XCTest
@testable import FlickrApp

class ImageSearchViewModelTests: XCTestCase {

    var viewModel: ImageSearchViewModel!
    var mockAPIService: MockAPIService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        viewModel = ImageSearchViewModel(apiService: mockAPIService)
        cancellables = []
    }
    
    func testSearchImages() {
        let expectation = XCTestExpectation(description: "Weather fetched successfully")
        
        viewModel.$images
            .sink { data in
                if data.count > 0 {
                    expectation.fulfill()
                }
        }.store(in: &cancellables)
        
        viewModel.searchImages(for: "forest")
        wait(for: [expectation])
    }
}
