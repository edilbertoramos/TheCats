//
//  FeedDetailData.swift
//  TheCats
//
//  Created by Edilberto Ramos on 06/02/25.
//

import Foundation

struct FeedDetailData: Identifiable {
    var id: String
    var name: String
    var temperament: String
    var description: String
    var lifeSpan: String
    var origin: String
    var imageUrl: String
    var weight: String
    var grooming: Int
    var healthIssues: Int
    var intelligence: Int
    var energyLevel: Int
    var childFriendly: Int
    var hypoallergenic: Int
    var wikipediaURL: String
}

// MARK: - Factory
extension FeedDetailData {
    
    static func create(from result: FeedResult) -> Self {
        let breed = result.breeds?.first
        return FeedDetailData(
            id: result.id ?? "",
            name: breed?.name ?? "Unknown Breed",
            temperament: breed?.temperament ?? "Unknown Temperament",
            description: breed?.description ?? "No description available",
            lifeSpan: breed?.lifeSpan ?? "Unknown",
            origin: breed?.origin ?? "Unknown",
            imageUrl: result.url ?? "Unknown",
            weight: breed?.weight?.metric ?? "Unknown",
            grooming: breed?.grooming ?? 0,
            healthIssues: breed?.healthIssues ?? 0,
            intelligence: breed?.intelligence ?? 0,
            energyLevel: breed?.energyLevel ?? 0,
            childFriendly: breed?.childFriendly ?? 0,
            hypoallergenic: breed?.hypoallergenic ?? 0,
            wikipediaURL: breed?.wikipediaURL ?? "Unknown"
        )
    }
    
    static func createMock() -> Self {
        FeedDetailData(
            id: "m1TeHn2dH",
            name: "Arabian Mau",
            temperament: "Affectionate, Agile, Curious, Independent, Playful, Loyal",
            description: "Arabian Mau cats are social and energetic. ...",
            lifeSpan: "12 - 14 years",
            origin: "United Arab Emirates",
            imageUrl: "https://cdn2.thecatapi.com/images/m1TeHn2dH.jpg",
            weight: "8 - 16 lbs",
            grooming: 1,
            healthIssues: 1,
            intelligence: 3,
            energyLevel: 4,
            childFriendly: 4,
            hypoallergenic: 1,
            wikipediaURL: "https://en.wikipedia.org/wiki/Arabian_Mau"
        )
    }
    
}
