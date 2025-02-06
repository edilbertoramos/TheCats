//
//  FeedResult.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

struct FeedResult: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    let breeds: [Breed]?

    enum CodingKeys: String, CodingKey {
        case id, url, width, height, breeds
    }
}

// MARK: - Breed
struct Breed: Codable {
    let weight: Weight
    let id: String
    let name: String
    let temperament: String
    let origin: String
    let countryCodes: String
    let countryCode: String
    let description: String
    let lifeSpan: String
    let indoor: Int
    let lap: Int
    let altNames: String
    let adaptability: Int
    let affectionLevel: Int
    let childFriendly: Int
    let dogFriendly: Int
    let energyLevel: Int
    let grooming: Int
    let healthIssues: Int
    let intelligence: Int
    let sheddingLevel: Int
    let socialNeeds: Int
    let strangerFriendly: Int
    let vocalisation: Int
    let experimental: Int
    let hairless: Int
    let natural: Int
    let rare: Int
    let rex: Int
    let suppressedTail: Int
    let shortLegs: Int
    let wikipediaURL: String
    let hypoallergenic: Int
    let referenceImageID: String
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?

    enum CodingKeys: String, CodingKey {
        case weight, id, name, temperament, origin, countryCodes = "country_codes", countryCode = "country_code",
             description, lifeSpan = "life_span", indoor, lap, altNames = "alt_names", adaptability, affectionLevel = "affection_level",
             childFriendly = "child_friendly", dogFriendly = "dog_friendly", energyLevel = "energy_level", grooming, healthIssues = "health_issues",
             intelligence, sheddingLevel = "shedding_level", socialNeeds = "social_needs", strangerFriendly = "stranger_friendly",
             vocalisation, experimental, hairless, natural, rare, rex, suppressedTail = "suppressed_tail", shortLegs = "short_legs",
             wikipediaURL = "wikipedia_url", hypoallergenic, referenceImageID = "reference_image_id", cfaURL = "cfa_url",
             vetstreetURL = "vetstreet_url", vcahospitalsURL = "vcahospitals_url"
    }
}

// MARK: - Weight structure
struct Weight: Codable {
    let imperial: String
    let metric: String

    enum CodingKeys: String, CodingKey {
        case imperial, metric
    }
}
