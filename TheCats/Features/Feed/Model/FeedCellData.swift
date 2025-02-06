//
//  FeedCellData.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

struct FeedCellData {
    
    let url: String?
    let name: String?
    let origin: String?
    
}

// MARK: - Factory
extension FeedCellData {
    
    static func create(of result: FeedResult) -> Self {
        FeedCellData(
            url: result.url,
            name: result.breeds?.first?.name ?? "Unknown Breed",
            origin: result.breeds?.first?.origin ?? "Unknown Origin"
        )
    }
    
}
