//
//  MockFeedService.swift
//  TheCatsTests
//
//  Created by Edilberto Ramos on 06/02/25.
//

import Foundation
@testable import TheCats

class MockFeedService: FeedServiceProtocol {
    var shouldReturnError = false

    func feed(page: Int) async throws -> ServiceResult<[FeedResult]> {
        if shouldReturnError {
            return (Data(), .failure(.empty))
        } else {
            let feedResult = FeedResult(
                id: "DYOqsRy9f",
                url: "https://cdn2.thecatapi.com/images/DYOqsRy9f.jpg",
                width: 1080,
                height: 720,
                breeds: [mockBreed]
            )
            return (Data(), .success([feedResult]))
        }
    }
    
    let mockBreed = Breed(
        weight: Weight(imperial: "10 - 20", metric: "5 - 10"),
        id: "tang",
        name: "Turkish Angora",
        temperament: "Affectionate, Agile, Clever, Gentle, Intelligent, Playful, Social",
        origin: "Turkey",
        countryCodes: "TR",
        countryCode: "TR",
        description: "A smart and affectionate cat that bonds well with humans.",
        lifeSpan: "15 - 18",
        indoor: 0,
        lap: 1,
        altNames: "Ankara",
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 5,
        energyLevel: 5,
        grooming: 2,
        healthIssues: 2,
        intelligence: 5,
        sheddingLevel: 2,
        socialNeeds: 5,
        strangerFriendly: 5,
        vocalisation: 3,
        experimental: 0,
        hairless: 0,
        natural: 1,
        rare: 0,
        rex: 0,
        suppressedTail: 0,
        shortLegs: 0,
        wikipediaURL: "https://en.wikipedia.org/wiki/Turkish_Angora",
        hypoallergenic: 0,
        referenceImageID: "7CGV6WVXq",
        cfaURL: "http://cfa.org/Breeds/BreedsSthruT/TurkishAngora.aspx",
        vetstreetURL: "http://www.vetstreet.com/cats/turkish-angora",
        vcahospitalsURL: "https://vcahospitals.com/know-your-pet/cat-breeds/turkish-angora"
    )
}
