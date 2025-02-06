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
        VStack(spacing: .zero) {
            GeometryReader { proxy in
                AsyncImage(url: URL(string: data.url ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                } placeholder: {
                    Color
                        .gray.opacity(0.1)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay {
                            ProgressView()
                        }
                }
            }
            .frame(height: UIScreen.main.bounds.width * 0.3)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(data.name ?? "")
                    .font(.headline)
                    .lineLimit(1)
                Text(data.origin ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.white)
        }
        .background(Color.white)
        .clipped()
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16,
                style: .continuous
            )
        )
        .shadow(
            color: Color.gray.opacity(0.1),
            radius: 2,
            x: 0,
            y: 1
        )
    }
}

#Preview {
    FeedCardView(
        data: FeedCardData.createMock()
    )
}

