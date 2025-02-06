//
//  FeedViewModelTests.swift
//  TheCatsTests
//
//  Created by Edilberto Ramos on 06/02/25.
//

import XCTest
import Combine
@testable import TheCats

class FeedViewModelTests: XCTestCase {
    var viewModel: FeedViewModel!
    var mockService: MockFeedService!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockService = MockFeedService()
        viewModel = FeedViewModel(service: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        cancellables = []
        super.tearDown()
    }

    func testSuccessfulFetch() {
        // Given
        mockService.shouldReturnError = false
        let expectation = XCTestExpectation(description: "Fetching items completes")

        // When
        viewModel.fetchItems()
        
        // Then
        viewModel.$viewState
            .dropFirst()
            .sink { viewState in
                XCTAssertEqual(self.viewModel.page, 0, "Expected page is 0")
                XCTAssertEqual(self.viewModel.results.count, 1, "Expected 1 result")
                XCTAssertEqual(self.viewModel.results.first?.breeds?.first?.name, "Turkish Angora", "Expected breed name to be 'Turkish Angora'")
                XCTAssertNil(self.viewModel.errorMessage, "Expected no error message")
                XCTAssertEqual(viewState, .finished, "Expected viewState to be 'finished' after loading")

                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 3.0)
    }

    func testFetchError() {
        // Given
        mockService.shouldReturnError = true
        let expectation = XCTestExpectation(description: "Fetching items with error completes")

        // When
        viewModel.fetchItems()

        // Then
        viewModel.$viewState
            .dropFirst()
            .sink { viewState in
                XCTAssertEqual(self.viewModel.page, 0, "Expected page is 0")
                XCTAssertEqual(self.viewModel.results.count, 0, "Expected no results due to error")
                XCTAssertNotNil(self.viewModel.errorMessage, "Expected error message due to fetch failure")
                XCTAssertEqual(viewState, .finished, "Expected viewState to be 'finished' after fetching")

                expectation.fulfill()
            }
            .store(in: &cancellables)
        

        wait(for: [expectation], timeout: 3.0)
    }

    func testPagination() {
        // Given
        mockService.shouldReturnError = false
        let expectation = XCTestExpectation(description: "Fetching items and next page completes")

        // When
        viewModel.fetchItems()
        viewModel.fetchNextPage()
        
        // Then
        viewModel.$viewState
            .dropFirst()
            .sink { viewState in
                XCTAssertEqual(self.viewModel.page, 1, "Expected page is 1")
                XCTAssertNil(self.viewModel.errorMessage, "Expected no error message")
                XCTAssertTrue([1, 2].contains(self.viewModel.results.count), "Expected results count to increase after pagination")
                
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 3.0)
    }
    
}
