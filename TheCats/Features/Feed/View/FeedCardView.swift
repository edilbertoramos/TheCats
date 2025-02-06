//
//  FeedCardView.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import SwiftUI

struct FeedCardView: View {
    let data: FeedCardData
    
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
                    .gray.opacity(0.1)
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay {
                        ProgressView()
                    }
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
        .shadow(color: Color.gray.opacity(0.5), radius: 5)
    }
}

#Preview {
    FeedCardView(
        data: FeedCardData.createMock()
    )
}

