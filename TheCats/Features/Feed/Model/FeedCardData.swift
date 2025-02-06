//
//  FeedCardData.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

struct FeedCardData {
    
    let url: String?
    let name: String?
    let origin: String?
    
}

// MARK: - Factory
extension FeedCardData {
    
    static func create(of result: FeedResult) -> Self {
        FeedCardData(
            url: result.url,
            name: result.breeds?.first?.name ?? "Unknown Breed",
            origin: result.breeds?.first?.origin ?? "Unknown Origin"
        )
    }
    
    static func createMock() -> Self {
        FeedCardData(
            url: "https://cdn2.thecatapi.com/images/d55E_KMKZ.jpg",
            name: "American Bobtail",
            origin: "United States"
        )
    }
    
}
