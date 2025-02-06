//
//  FeedCell.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import SwiftUI

struct FeedCell: View {
    let data: FeedCellData
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: data.url ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
            } placeholder: {
                Color
                    .gray
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
            }
            Text(data.name ?? "")
                .font(.headline)
                .lineLimit(1)
            Text(data.origin ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    FeedCell(
        data: FeedCellData(
            url: "https://cdn2.thecatapi.com/images/d55E_KMKZ.jpg",
            name: "American Bobtail",
            origin: "United States"
        )
    )
}

