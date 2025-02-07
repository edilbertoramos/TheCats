//
//  MockFeedService.swift
//  TheCats
//
//  Created by Edilberto Ramos on 06/02/25.
//

import Foundation

class MockFeedService: FeedServiceProtocol {
    var shouldReturnError = false
    
    func feed(page: Int) async throws -> ServiceResult<[FeedResult]> {
        if UITestingHelper.isFeedSuccess {
            return (Data(), .success(mock()))
        } else {
            return (Data(), .failure(.internalServerError))
        }
    }
    
    func mock() -> [FeedResult] {
        
        let jsonData = """
        [
          {
            "id": "1",
            "url": "https://cdn2.thecatapi.com/images/xnsqonbjW.jpg",
            "width": 1000,
            "height": 964,
            "breeds": [
              {
                    "id": "1",
                "temperament": "Affectionate, Curious, Intelligent, Interactive, Lively, Playful, Social",
                "life_span": "12 - 16",
                "name": "American Curl",
                "origin": "United States",
                "wikipedia_url": "https://en.wikipedia.org/wiki/American_Curl",
                "weight": {
                  "metric": "2 - 5",
                  "imperial": "5 - 10"
                },
                "dog_friendly": 5
              }
            ]
          },
          {
            "id": "2",
            "url": "https://cdn2.thecatapi.com/images/znCxQCEp4.jpg",
            "width": 881,
            "height": 1280,
            "breeds": [
              {
                    "id": "2",
                "temperament": "Affectionate, Active, Gentle, Social",
                "life_span": "14 - 15",
                "name": "Birman",
                "origin": "France",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Birman",
                "weight": {
                  "metric": "3 - 7",
                  "imperial": "6 - 15"
                },
                "dog_friendly": 5
              }
            ]
          },
          {
            "id": "3",
            "url": "https://cdn2.thecatapi.com/images/--YZl1YWO.jpg",
            "width": 1440,
            "height": 1585,
            "breeds": [
              {
                    "id": "3",
                "temperament": "Affectionate, Friendly, Gentle, Calm",
                "life_span": "12 - 16",
                "name": "Ragamuffin",
                "origin": "United States",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Ragamuffin_cat",
                "weight": {
                  "metric": "4 - 9",
                  "imperial": "8 - 20"
                },
                "dog_friendly": 5
              }
            ]
          },
          {
            "id": "4",
            "url": "https://cdn2.thecatapi.com/images/bju16uKfD.jpg",
            "width": 750,
            "height": 871,
            "breeds": [
              {
                    "id": "4",
                "temperament": "Affectionate, Friendly, Gentle, Quiet, Easygoing",
                "life_span": "12 - 17",
                "name": "Ragdoll",
                "origin": "United States",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Ragdoll",
                "weight": {
                  "metric": "5 - 9",
                  "imperial": "12 - 20"
                },
                "dog_friendly": 5
              }
            ]
          },
          {
            "id": "5",
            "url": "https://cdn2.thecatapi.com/images/ILx2VfmiR.jpg",
            "width": 1200,
            "height": 824,
            "breeds": [
              {
                    "id": "5",
                "temperament": "Affectionate, Friendly, Gentle, Quiet, Easygoing",
                "life_span": "12 - 17",
                "name": "Ragdoll",
                "origin": "United States",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Ragdoll",
                "weight": {
                  "metric": "5 - 9",
                  "imperial": "12 - 20"
                },
                "dog_friendly": 5
              }
            ]
          },
          {
            "id": "6",
            "url": "https://cdn2.thecatapi.com/images/z0cI0mqjr.jpg",
            "width": 1600,
            "height": 1207,
            "breeds": [
              {
                    "id": "6",
                "temperament": "Mischievous, Tenacious, Intelligent, Affectionate, Gentle, Interactive, Loyal",
                "life_span": "12 - 16",
                "name": "Somali",
                "origin": "Somalia",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Somali_(cat)",
                "weight": {
                  "metric": "3 - 5",
                  "imperial": "6 - 12"
                },
                "dog_friendly": 4
              }
            ]
          },
          {
            "id": "7",
            "url": "https://cdn2.thecatapi.com/images/YOjBThApG.jpg",
            "width": 2838,
            "height": 4518,
            "breeds": [
              {
                    "id": "7",
                "temperament": "Sweet, Affectionate, Loyal",
                "life_span": "10 - 15",
                "name": "European Burmese",
                "origin": "Burma",
                "wikipedia_url": "https://en.wikipedia.org/wiki/European_Burmese",
                "weight": {
                  "metric": "3 - 6",
                  "imperial": "7 - 14"
                },
                "dog_friendly": 4
              }
            ]
          },
          {
            "id": "8",
            "url": "https://cdn2.thecatapi.com/images/dOqenzV1K.jpg",
            "width": 768,
            "height": 960,
            "breeds": [
              {
                "id": "8",
                "temperament": "Mischievous, Tenacious, Intelligent, Affectionate, Gentle, Interactive, Loyal",
                "life_span": "12 - 16",
                "name": "Somali",
                "origin": "Somalia",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Somali_(cat)",
                "weight": {
                  "metric": "3 - 5",
                  "imperial": "6 - 12"
                },
                "dog_friendly": 4
              }
            ]
          },
          {
            "id": "9",
            "url": "https://cdn2.thecatapi.com/images/MuIB88nqJ.jpg",
            "width": 1024,
            "height": 1024,
            "breeds": [
              {
                    "id": "9",
                "temperament": "Mischievous, Tenacious, Intelligent, Affectionate, Gentle, Interactive, Loyal",
                "life_span": "12 - 16",
                "name": "Somali",
                "origin": "Somalia",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Somali_(cat)",
                "weight": {
                  "metric": "3 - 5",
                  "imperial": "6 - 12"
                },
                "dog_friendly": 4
              }
            ]
          },
          {
            "id": "10",
            "url": "https://cdn2.thecatapi.com/images/--YZl1YWO.jpg",
            "width": 1440,
            "height": 1585,
            "breeds": [
              {
                "id": "10",
                "temperament": "Affectionate, Friendly, Gentle, Calm",
                "life_span": "12 - 16",
                "name": "Ragamuffin",
                "origin": "United States",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Ragamuffin_cat",
                "weight": {
                  "metric": "4 - 9",
                  "imperial": "8 - 20"
                },
                "dog_friendly": 5
              }
            ]
          }
        ]
        """.data(using: .utf8)!
        
        // Decode the JSON data into an array of FeedResult objects
        do {
            let decoder = JSONDecoder()
            let feedResults = try decoder.decode([FeedResult].self, from: jsonData)
            return feedResults
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }

    
}
