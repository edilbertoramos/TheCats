//
//  FeedResult.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

struct FeedResult: Codable {
    let id: String
    let url: String?
    let width: Int?
    let height: Int?
    let breeds: [Breed]?

    enum CodingKeys: String, CodingKey {
        case id, url, width, height, breeds
    }
}

// MARK: - Breed
struct Breed: Codable {
    let weight: Weight?
    let id: String
    let name: String?
    let temperament: String?
    let origin: String?
    let countryCodes: String?
    let countryCode: String?
    let description: String?
    let lifeSpan: String?
    let indoor: Int?
    let lap: Int?
    let altNames: String?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let dogFriendly: Int?
    let energyLevel: Int?
    let grooming: Int?
    let healthIssues: Int?
    let intelligence: Int?
    let sheddingLevel: Int?
    let socialNeeds: Int?
    let strangerFriendly: Int?
    let vocalisation: Int?
    let experimental: Int?
    let hairless: Int?
    let natural: Int?
    let rare: Int?
    let rex: Int?
    let suppressedTail: Int?
    let shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int?
    let referenceImageID: String?
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?

    enum CodingKeys: String, CodingKey {
        case weight
        case id
        case name
        case temperament
        case origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor
        case lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation
        case experimental
        case hairless
        case natural
        case rare
        case rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
    }
}

// MARK: - Weight structure
struct Weight: Codable {
    let imperial: String?
    let metric: String?

    enum CodingKeys: String, CodingKey {
        case imperial, metric
    }
}
